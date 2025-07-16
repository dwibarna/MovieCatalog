//
//  CoreDataStack.swift
//  MovieCatalog
//
//  Created by Dwi Aji Sobarna on 16/07/25.
//

import Foundation
import CoreData

class CoreDataStack {
    static let shared = CoreDataStack()
    
    let container: NSPersistentContainer
    
    var context: NSManagedObjectContext {
        container.viewContext
    }
    
    private init() {
        container = NSPersistentContainer(name: "MovieCatalog")
        container.loadPersistentStores { desc, error in
            if let error = error {
                fatalError("💥 Failed to load Core Data store: \(error.localizedDescription)")
            }
        }
    }
    
    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("❌ Failed to save context: \(error.localizedDescription)")
            }
        }
    }
}
