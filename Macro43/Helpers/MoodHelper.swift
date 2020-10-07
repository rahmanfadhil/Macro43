//
//  MoodHelper.swift
//  Macro43
//
//  Created by Rahman Fadhil on 07/10/20.
//

import UIKit
import CoreData

class MoodHelper {
    lazy var context: NSManagedObjectContext = {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        return context
    }()
    
    func retrieve(onComplete: @escaping (Error?, [Mood]) -> Void) {
        let request = NSFetchRequest<Mood>(entityName: "Mood")
        do {
            let data = try context.fetch(request)
            onComplete(nil, data)
        } catch {
            onComplete(error, [Mood]())
        }
    }
}
