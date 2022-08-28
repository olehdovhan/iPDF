//
//  CoreDataManager.swift
//  iPDF
//
//  Created by O l e h on 27.08.2022.
//

import CoreData
import UIKit


class CoreDataManager {
    
    var moDoc: MODocument!
    var moStoredDocs: [MODocument]!
    
    lazy var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.newBackgroundContext()
    
    func createDocEntity(name: String,
                         size: Double,
                         editDate: String,
                         fileUrl: String) {
        guard let entity = NSEntityDescription.entity(forEntityName: "MODocument", in: context) else { return }
        moDoc = NSManagedObject(entity: entity, insertInto: context) as? MODocument
        moDoc.fileName = name
        moDoc.size = size
        moDoc.editDate = editDate
        moDoc.fileURL = fileUrl
        do{
            try self.context.save()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    func getMODocs() -> [MODocument]? {
        let fetchRequest: NSFetchRequest<MODocument> = MODocument.fetchRequest()
        do {
            let results = try context.fetch(fetchRequest)
            guard results.first != nil else { return nil }
            moStoredDocs = results
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return moStoredDocs
    }
    
    static var shared: CoreDataManager = {
        let instance = CoreDataManager()
        return instance
    }()
    
    private init() {}
}

extension CoreDataManager: NSCopying {
    func copy(with zone: NSZone? = nil) -> Any {
        return self
    }
}



