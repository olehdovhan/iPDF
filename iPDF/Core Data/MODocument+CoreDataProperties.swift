//
//  MODocument+CoreDataProperties.swift
//  iPDF
//
//  Created by O l e h on 27.08.2022.
//
//

import Foundation
import CoreData


extension MODocument {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MODocument> {
        return NSFetchRequest<MODocument>(entityName: "MODocument")
    }

    @NSManaged public var size: Double
    @NSManaged public var fileURL: String?
    @NSManaged public var fileName: String?
    @NSManaged public var editDate: String?

}

extension MODocument : Identifiable {

}
