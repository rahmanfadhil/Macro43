//
//  MoodHelper.swift
//  Macro43
//
//  Created by Rahman Fadhil on 07/10/20.
//

import UIKit
import CoreData

class MoodHelper {
    let entityName = "Mood"
    
    lazy var context: NSManagedObjectContext = {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        return context
    }()
    
    func retrieve(onComplete: @escaping (Error?, [Mood]) -> Void) {
        let request = NSFetchRequest<Mood>(entityName: entityName)
        do {
            let data = try context.fetch(request)
            onComplete(nil, data)
        } catch {
            onComplete(error, [Mood]())
        }
    }
    
    func save(name: String, confidence: Float16, onComplete: @escaping (Error?) -> Void) {
        let entity = NSEntityDescription.entity(forEntityName: entityName, in: context)
        let mood = NSManagedObject(entity: entity!, insertInto: context)
        mood.setValue(name, forKey: "type")
        mood.setValue(confidence, forKey: "confidence")
        mood.setValue(Date(), forKey: "testedAt")
        
        do {
            try context.save()
            onComplete(nil)
        } catch {
            onComplete(error)
        }
    }
}
