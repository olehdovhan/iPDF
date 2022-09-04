//
//  AlternateMixModel.swift
//  iPDF
//
//  Created by O l e h on 03.09.2022.
//

import Foundation
import PDFKit

struct AlternateMixModel {
    var pages: [PDFPage]
    var afterPage: Int
    var reverse: Bool
    
    mutating func deletePages() {
        pages = del(array: pages, beforeIndex: afterPage)
    }
    
    func del<T>(array: [T], beforeIndex: Int) -> [T] {
        let cuttedArray = array.enumerated()
                               .filter{ $0.offset >= (beforeIndex )}
                               .map{ $0.element}
        return cuttedArray
    }
}
