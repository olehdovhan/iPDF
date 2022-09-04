//
//  CombineReorderManager.swift
//  iPDF
//
//  Created by O l e h on 03.09.2022.
//

import Foundation
import PDFKit

protocol CombineReorderProtocol {
    func createfirstDoc() -> PDFDocument?
    func deletePages()
    func rotatePages()
    func selectPage(_ sender: UIButton)
    func tempSave()
    func deleteTempFiles()
    func fillPageModels()
}

class CombineReorderManager: CombineReorderProtocol {

    var documentPicker: DocumentPicker!
    var pageModels = [CombineReorderModel]()
    var urls = [URL]()
    var fileIndices: [Int]
    var selectedFiles = [CombineReorderModel]()
    var tempDocuments = [PDFDocument]()
    var tempNames = [String]()
    var uniqueName: String {
        let timeInt = Date().timeIntervalSince1970
        let intTime = Int(timeInt)
        return "\(String(intTime)).pdf"
    }
    
    var selectedModelIndex = 0 {
        didSet {
            print(selectedModelIndex)
        }
    }
    
    var lastFileUrl: URL? {
        guard let doc = CoreDataManager.shared.getMODocs()?.last,
              let stringUrl = doc.fileURL,
              let url = URL(string: stringUrl) else { return nil}
        return url
    }
    
    init(indices: [Int]) {
      self.fileIndices = indices
        if let doc = createfirstDoc() {
            tempDocuments.append(doc)
        }
    }
    
    func deleteFiles(_ fileToDelete: String) {
            let fName = fileToDelete.getFileName()
            let fExtension = fileToDelete.getFileExtension()
            
            let fURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            
        let deleteAtURL = fURL.appendingPathComponent(fName).appendingPathExtension("pdf")
            
            do {
                try FileManager.default.removeItem(at: deleteAtURL)
                print("Image has been deleted")
            } catch {
                print(error)
            }
        }
    
    func finalSave() {
        
        let doc =  FileSaver.shared.createPDFDoc(from: pageModels.map({$0.page}))
        FileSaver.shared.fileExistsAtPath(name: "Combined.pdf", document: doc)
        for name in tempNames {
            var nam = name
            nam.removeLast()
            nam.removeLast()
            nam.removeLast()
            nam.removeLast()
            deleteFiles(nam)
            
        }
        CoreDataManager.shared.deleteMODocs(tempNames)
    }
    
    func createfirstDoc() -> PDFDocument? {
        guard let docs = CoreDataManager.shared.getMODocs() else { return nil }
        for (index, element) in fileIndices.enumerated() {
            guard let urlString = docs[element].fileURL,
                  let url = URL(string: urlString),
                  let doc = PDFDocument(url: url) else { return nil }
           
            for pageNumber in 0...doc.pageCount - 1 {
                if let page = doc.page(at: pageNumber) {
                    let model = CombineReorderModel(page: page,
                                                    number: pageNumber,
                                                    url: url,
                                                    selectedBool: false)
                    pageModels.append(model)
                }
            }
        }
        let doc =  FileSaver.shared.createPDFDoc(from: pageModels.map({$0.page}))
        let name = uniqueName
        tempNames.append(name)
        FileSaver.shared.fileExistsAtPath(name: name, document: doc)
        return doc
    }
    
    func addNewDoc(completion: () -> ()) {
        guard let url = lastFileUrl,
              let doc = PDFDocument(url: url) else { return }
        
        for pageNumber in 0...doc.pageCount - 1 {
            if let page = doc.page(at: pageNumber) {
                let model = CombineReorderModel(page: page,
                                                number: pageNumber,
                                                url: url,
                                                selectedBool: false)
                pageModels.append(model)
            }
        }
        let pdfDoc =  FileSaver.shared.createPDFDoc(from: pageModels.map({$0.page}))
        let name = uniqueName
        tempNames.append(name)
        FileSaver.shared.fileExistsAtPath(name: name, document: pdfDoc)
        tempDocuments.append(pdfDoc)
        selectedModelIndex += 1
        completion()
    }
    
    func addBlankPage() {
        let blankPdfDoc = PDFDocument()
        let name = uniqueName
        tempNames.append(name)
        FileSaver.shared.fileExistsAtPath(name: name, document: blankPdfDoc)
        guard let url = lastFileUrl,
               let doc = PDFDocument(url: url),
                let page = doc.page(at: 0) else { return }
        let model = CombineReorderModel(page: page,
                                        number: tempDocuments[selectedModelIndex].pageCount,
                                        url: url,
                                        selectedBool: false)
        
        pageModels.append(model)
        
        let pagesArray = pageModels.map({ $0.page})
        let newDoc = FileSaver.shared.createPDFDoc(from: pagesArray)
        tempDocuments.append(newDoc)
        selectedModelIndex += 1
        let name1 = uniqueName
        tempNames.append(name1)
        FileSaver.shared.fileExistsAtPath(name: name1, document: newDoc)
    }

    
    func reorderPages() {
        selectedFiles.removeAll()
        pageModels = reverseOrder(array: pageModels)
        
        let pagesArray = pageModels.map({ $0.page})
        let newDoc = FileSaver.shared.createPDFDoc(from: pagesArray)
        tempDocuments.append(newDoc)
        selectedModelIndex += 1
        let name = uniqueName
        tempNames.append(name)
        FileSaver.shared.fileExistsAtPath(name: name, document: newDoc)
    }
    
    func reverseOrder<T>(array: [T]) -> [T] {
        let reversedTuple = Array(array.enumerated().reversed())
        var reverseArray = [T]()
        for (_, element) in reversedTuple {
            reverseArray.append(element)
        }
        return reverseArray
    }
    
    deinit {
        deleteTempFiles()
    }
    

    
    func tempSave() {
        selectedModelIndex += 1
        let pdfPages = pageModels.map({$0.page})
        let doc = FileSaver.shared.createPDFDoc(from: pdfPages)
        let timeInt = Date().timeIntervalSince1970
        let intTime = Int(timeInt)
        
        FileSaver.shared.fileExistsAtPath(name: "\(String(intTime)).pdf",
                                          document: doc)
    }
    
    func deleteTempFiles() {
//        for url in urls {
//            do {
//              try FileManager.default.removeItem(at: url)
//            } catch {
//                print(error.localizedDescription)
//            }
//        }
    }
    
    func deletePages() {
        
        let pageBalance = tempDocuments[selectedModelIndex].pageCount - selectedFiles.count
        
        guard pageBalance >= 1 else { return }
        
        for model in selectedFiles {
            pageModels = pageModels.filter{ $0 != model }
        }
        
        let pagesArray = pageModels.map({ $0.page})
        let newDoc = FileSaver.shared.createPDFDoc(from: pagesArray)
        tempDocuments.append(newDoc)
        selectedModelIndex += 1
        let name = uniqueName
        tempNames.append(name)
        FileSaver.shared.fileExistsAtPath(name: name, document: newDoc)
//        urls.append(lastFileUrl)
        
        
        selectedFiles.removeAll()
      //  tempSave()
    }
    
    func rotatePages() {
        var numbers = selectedFiles.map({$0.number})
        for number in numbers {
            pageModels[number].page.rotation += 90
        }
        
        let pagesArray = pageModels.map({ $0.page})
        let newDoc = FileSaver.shared.createPDFDoc(from: pagesArray)
        tempDocuments.append(newDoc)
        selectedModelIndex += 1
        let name = uniqueName
        tempNames.append(name)
        FileSaver.shared.fileExistsAtPath(name: name, document: newDoc)
//        urls.append(lastFileUrl)
        selectedFiles.removeAll()
       // tempSave()
    }
        
    func selectPage(_ sender: UIButton) {
        switch sender.isSelected {
        case true:
            selectedFiles.append(pageModels[sender.tag])
        case false:
            selectedFiles = selectedFiles.filter{ $0 != pageModels[sender.tag] }
        }
    }
      
    func fillPageModels() {
        pageModels.removeAll()
        let fillUrl = urls[selectedModelIndex]
        guard let doc = PDFDocument(url: fillUrl) else { return }
              for i in 1...doc.pageCount {
                  guard let page = doc.page(at: i) else { return  }
                  let pageModel = CombineReorderModel(page: page,
                                                      number: i,
                                                      url: fillUrl,
                                                      selectedBool: false)
                  pageModels.append(pageModel)
        }
    }
    
    func mergeFiles() -> PDFDocument?{
        
        guard let docs = CoreDataManager.shared.getMODocs(),
              let string = docs[fileIndices[0]].fileURL,
              let url = URL(string: string )  else { return nil }
        
     let firstDoc = PDFDocument(url: url)
        for i in 1...fileIndices.count - 1  {
            
            var fileIndex = fileIndices[i]
            guard let docs = CoreDataManager.shared.getMODocs(),
                   let string = docs[fileIndex].fileURL,
                   let url2 = URL(string: string )  else { return firstDoc }
            let doc = PDFDocument(url: url2)
            firstDoc?.addPages(from: doc!)
        }
        return firstDoc
    }
}

