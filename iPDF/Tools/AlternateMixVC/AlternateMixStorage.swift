//
//  AlternateMixStorage.swift
//  iPDF
//
//  Created by O l e h on 03.09.2022.
//

import Foundation

class AlternateMixStorage {
    
    var alternatedModels = [AlternateMixModel]()
    
    static var shared: AlternateMixStorage = {
        let instance = AlternateMixStorage()
        return instance
    }()
    private init() { }
}

extension AlternateMixStorage: NSCopying {
    func copy(with zone: NSZone? = nil) -> Any {
        return self
    }
}
