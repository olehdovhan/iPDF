//
//  DocumentDelegate.swift
//  iPDF
//
//  Created by O l e h on 27.08.2022.
//

import Foundation

public enum SourceType: Int {
    case files
    case folder
}

protocol DocumentDelegate: class {
    func didPickDocuments(pickDocuments: [Document]?)
}
