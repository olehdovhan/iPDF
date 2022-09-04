//
//  AlternateMixManager.swift
//  iPDF
//
//  Created by O l e h on 03.09.2022.
//

import UIKit
import PDFKit

protocol AlternateMixProtocol {
    
    var models: [AlternateMixModel] { get set }
    func initializeModels()
    
}

class AlternateMixManager: AlternateMixProtocol
{
    
    var fileIndices: [Int]
    var models: [AlternateMixModel] {
        get {
            AlternateMixStorage.shared.alternatedModels
        }
        set {
            AlternateMixStorage.shared.alternatedModels = newValue
        }
    }
    
    init(indices: [Int]) {
        self.fileIndices = indices
        initializeModels()
    }
    
    func initializeModels() {
        
        guard let docs = CoreDataManager.shared.getMODocs() else { return }
        for (_,element) in fileIndices.enumerated() {
            guard let url = URL(string: docs[element].fileURL!),
            let doc = PDFDocument(url: url) else { return }
            var pdfPages = [PDFPage]()
            for i in 0...doc.pageCount - 1 {
                guard let page = doc.page(at: i) else { return }
                pdfPages.append(page)
            }
            let model = AlternateMixModel(pages: pdfPages,
                                          afterPage: 1,
                                          reverse: false)
            models.append(model)
        }
    }
    
    func createAndSaveDoc(from pages: [PDFPage]) -> PDFDocument {
        
        let blankDoc = PDFDocument()
        for (index,element) in pages.enumerated() {
            blankDoc.insert(element, at: index)
        }
        return blankDoc
    }
    
    func cut<T>(array: [T], afterIndex: Int ) -> [T] {
        let cuttedArray = array.enumerated()
                               .filter{ $0.offset <= (afterIndex - 1)}
                               .map{ $0.element}
        return cuttedArray
    }
    
    func indexMaxArray<T>(array: [[T]]) -> Int {
        var maxIndexArray = 0
        var indexM = 0
        for (index, nestedArray) in array.enumerated() {
            if nestedArray.count > maxIndexArray {
                maxIndexArray = nestedArray.count
                indexM = index
            }
        }
        return indexM
    }

    func mixPages(from modelArray: [AlternateMixModel]) -> [PDFPage] {
        var finalArray = [PDFPage]()
      var temp = modelArray
        let indexMaxArray = indexMaxArray(array: temp.map{$0.pages})
        while temp[indexMaxArray].pages.count > 0 {
        for i in 0...temp.count - 1 {
            let cutted = cut(array: temp[i].pages,
                             afterIndex: temp[i].afterPage)
            cutted.enumerated().forEach { (_,element) in
                finalArray.append(element)
            }
            temp[i].deletePages()
            print(temp[i])
            }
        }
        return finalArray
    }
}
