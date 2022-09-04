//
//  DocumentPicker.swift
//  iPDF
//
//  Created by O l e h on 27.08.2022.
//


import UIKit
import MobileCoreServices
import PDFKit

open class DocumentPicker: NSObject {
    private var pickerController: UIDocumentPickerViewController?
    private weak var presentationController: UIViewController?
    private weak var delegate: DocumentDelegate?
    
    private var folderURL: URL?
    private var sourceType: SourceType!
    private var documents = [Document]()
    
    init(presentationController: UIViewController, delegate: DocumentDelegate) {
        super.init()
        
        self.presentationController = presentationController
        self.delegate = delegate
        
    }
    
    public func folderAction(for type: SourceType, title: String) -> UIAlertAction? {
        return UIAlertAction(title: title, style: .default) { [unowned self] _ in
            self.pickerController = UIDocumentPickerViewController(documentTypes: [kUTTypeFolder as String], in: .open)
            self.pickerController!.delegate = self
            self.sourceType = type
            self.presentationController?.present(self.pickerController!, animated: true)
        }
    }
    
    public func fileAction(for type: SourceType, title: String) -> UIAlertAction? {
        return UIAlertAction(title: title, style: .default) { [unowned self] _ in
            self.pickerController = UIDocumentPickerViewController(documentTypes: [ kUTTypePDF as String], in: .open)
            self.pickerController!.delegate = self
            self.pickerController!.allowsMultipleSelection = true
            self.sourceType = type
            self.presentationController?.present(self.pickerController!, animated: true)
        }
    }
    
    public func present() {
        
        let alertController = UIAlertController(title: "Select From", message: nil, preferredStyle: .actionSheet)
        
        if let action = self.fileAction(for: .files, title: "Files") {
            alertController.addAction(action)
        }
        
        if let action = self.folderAction(for: .folder, title: "Folder") {
            alertController.addAction(action)
        }
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.presentationController?.present(alertController, animated: true)
    }
}

extension DocumentPicker: UIDocumentPickerDelegate {
    
    public func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        
        guard let url = urls.first else {
            return
        }
        documentFromURL(pickedURL: url)
        delegate?.didPickDocuments(pickDocuments: documents)
        documents.removeAll()
    }
    
    public func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        delegate?.didPickDocuments(pickDocuments: nil)
    }
    
    private func documentFromURL(pickedURL: URL) {
        let shouldStopAccessing = pickedURL.startAccessingSecurityScopedResource()
        
        defer {
            if shouldStopAccessing {
                pickedURL.stopAccessingSecurityScopedResource()
            }
        }
        
        NSFileCoordinator().coordinate(readingItemAt: pickedURL, error: NSErrorPointer.none) { (folderURL) in
            
            do {
                let keys: [URLResourceKey] = [.nameKey, .isDirectoryKey]
                let fileList = try FileManager.default.enumerator(at: pickedURL, includingPropertiesForKeys: keys)
                
                switch sourceType {
                case .files:
                    let document = Document(fileURL: pickedURL)
                    documents.append(document)
                    let fileName = document.fileURL.lastPathComponent
                    fileExistsAtPath(name: fileName,
                                     document: PDFDocument(url: document.fileURL)!)
                    
                case .folder:
                    for case let fileURL as URL in fileList! {
                        if !fileURL.isDirectory {
                            let document = Document(fileURL: fileURL)
                            documents.append(document)
                            fileExistsAtPath(name: document.fileURL.lastPathComponent,
                                             document: PDFDocument(url: document.fileURL)!)
                        }
                    }
                case .none:
                    break
                }
            } catch let error {
                print("error: ", error.localizedDescription)
            }
        }
    }
    
    
    func savePDF(document: PDFDocument, name: String) {
        
        guard let data = document.dataRepresentation() else { return }
        
        guard let path = FileManager
                .default
                .urls(for: .documentDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent("\(name).pdf") else { return }
        do {
            try data.write(to: path)
            // BookMark
            if let url = URL(string: path.absoluteString) {
            // Convert URL to bookmark
                let bookmarkData = try url.bookmarkData(options: .minimalBookmark, includingResourceValuesForKeys: nil)
                
                // Save the bookmark into a file (the name of the file is a UUID)
                let uuid = UUID().uuidString
                try bookmarkData.write(to: getAppSandboxDirectory().appendingPathComponent(uuid))
            }
            
            CoreDataManager.shared.createDocEntity(name: "\(name).pdf",
                                                   size: sizePerKB(url: path),
                                                   editDate: stringDate(url: path),
                                                   fileUrl: path.absoluteString)
        } catch {}
    }
    
    private func getAppSandboxDirectory() -> URL {
           FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
       }
    
    func fileExistsAtPath(name: String, document: PDFDocument) {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let url = NSURL(fileURLWithPath: path)
        if let pathComponent = url.appendingPathComponent(name) {
            let filePath = pathComponent.path
            let fileManager = FileManager.default
            printAllFiles()
            if fileManager.fileExists(atPath: filePath) {
                let newName = name.stringBefore(".") + "1"
                savePDF(document: document, name: newName)
            } else {
                savePDF(document: document, name: name.stringBefore("."))
            }
        } else {
            print("FILE PATH NOT AVAILABLE")
        }
    }
    
    func printAllFiles() {
        let fm = FileManager.default
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        
        
        do {
            let items = try fm.contentsOfDirectory(atPath: path)
            
            for item in items {
                print("Found \(item)")
            }
        } catch {
            // failed to read directory – bad permissions, perhaps?
        }
    }
    
}

extension DocumentPicker: UINavigationControllerDelegate {
}

extension DocumentPicker {
    
    func sizePerKB(url: URL?) -> Double {
        
        guard let filePath = url?.path else {
            return 0.0
        }
        do {
            let attribute = try FileManager.default.attributesOfItem(atPath: filePath)
            if let size = attribute[FileAttributeKey.size] as? NSNumber {
                return size.doubleValue / 1000.0
            }
        } catch {
            print("Error: \(error)")
        }
        return 0.0
    }
    
    func stringDate(url: URL?) -> String {
        guard let filePath = url?.path else { return ""}
        do {
            let attribute = try FileManager.default.attributesOfItem(atPath: filePath)
            if let date = attribute[FileAttributeKey.creationDate] as? NSDate {
                return stringFromDate(date as Date)
            }
        } catch {
            print("Error: \(error)")
        }
        return ""
    }
    
    func stringFromDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        return formatter.string(from: date)
    }
}
