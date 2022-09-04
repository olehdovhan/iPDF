//
//  FileSaver.swift
//  iPDF
//
//  Created by O l e h on 03.09.2022.
//

import Foundation
import PDFKit

class FileSaver {
    
   static var shared: FileSaver = {
        let instance = FileSaver()
        return instance
    }()
    
    func createPDFDoc(from pages: [PDFPage]) -> PDFDocument {
        
        let blankDoc = PDFDocument()
        for (index,element) in pages.enumerated() {
            blankDoc.insert(element, at: index)
        }
        return blankDoc
    }
    
    private init() { }
    
    func savePDF(document: PDFDocument, name: String) {
        
        guard let data = document.dataRepresentation() else { return }
        
        guard let path = FileManager
                .default
                .urls(for: .documentDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent("\(name).pdf") else { return }
        do {
            try data.write(to: path)
            CoreDataManager.shared.createDocEntity(name: "\(name).pdf",
                                                   size: sizePerKB(url: path),
                                                   editDate: stringDate(url: path),
                                                   fileUrl: path.absoluteString)
        } catch {}
    }
    
    func fileExistsAtPath(name: String, document: PDFDocument) {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let url = NSURL(fileURLWithPath: path)
        if let pathComponent = url.appendingPathComponent(name) {
            let filePath = pathComponent.path
            let fileManager = FileManager.default
            
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
extension FileSaver: NSCopying {
    func copy(with zone: NSZone? = nil) -> Any {
        return self
    }
}
