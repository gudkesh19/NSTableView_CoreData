//
//  StudentsManager.swift
//  StudentsList
//
//  Created by Gudkesh Kumar on 11/01/19.
//  Copyright © 2019 Exilant. All rights reserved.
//

import Cocoa
import CoreData

class StudentsPersistanceManager: NSObject {

    private var model: String
    
    var mainContext: NSManagedObjectContext {
        return storeContainer.viewContext
    }
    
    private lazy var storeContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: model)
        container.loadPersistentStores { (_, error) in
            container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
            if let error = error {
                fatalError("Unable to load persistentStore: \(error)")
            }
        }
        return container
    }()
    
    
    init(with model: String) {
        self.model = model
    }
    
    
    func performBackgroundTask(_ block: @escaping (NSManagedObjectContext) -> Void) {
        storeContainer.performBackgroundTask(block)
    }
    
    func performViewTask( _ block:  @escaping (NSManagedObjectContext) -> Void) {
        block(storeContainer.viewContext)
    }
    
}
