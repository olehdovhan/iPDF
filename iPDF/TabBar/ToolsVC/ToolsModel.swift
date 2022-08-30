//
//  ToolsModel.swift
//  iPDF
//
//  Created by O l e h on 30.08.2022.
//

import Foundation


struct ToolsModel {
    
    var imgName: Images
    var name: String
    
    static let tools = [ToolsModel(imgName: .merge, name: "Merge"),
                        ToolsModel(imgName: .combineReorder, name: "Combine & Reorder"),
                        ToolsModel(imgName: .alternateMix, name: "Alternate & Mix")]
}
