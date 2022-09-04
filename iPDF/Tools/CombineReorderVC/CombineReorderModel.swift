//
//  CombineReorderModel.swift
//  iPDF
//
//  Created by O l e h on 03.09.2022.
//

import Foundation
import PDFKit

struct CombineReorderModel: Hashable {
    var page: PDFPage
    var number: Int
    var url: URL
    var selectedBool: Bool
}
