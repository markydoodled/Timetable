//
//  Persistence.swift
//  Timetable iOS
//
//  Created by Mark Howard on 26/10/2022.
//

import CoreData

//Define A Struct For The Persistence Controller
struct PersistenceController {
    //Create A Shared Instance Of The Persistence Controller
    static let shared = PersistenceController()
    //Create A Preview Instance Of The Persistence Controller
    static var preview: PersistenceController = {
        let controller = PersistenceController(inMemory: true)
        return controller
    }()
    
    //Define A Container For The Persistent Store
    let container: NSPersistentContainer
    
    //Initialize The Persistence Controller
    init(inMemory: Bool = false) {
        //Create A Persistent Container With The Name "TaskModel"
        container = NSPersistentContainer(name: "TaskModel")
        
        //If inMemory Is True, Set The Persistent Store URL To /dev/null
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        
        //Load The Persistent Stores
        container.loadPersistentStores { description, error in
            //If There's An Error, Print It And Crash The App
            if let error = error {
                fatalError("Error - \(error.localizedDescription)")
            }
        }
    }
    
    //Define A Function To Save Changes To The Persistent Store
    func save() {
        let context = container.viewContext
        
        //If There Are Changes, Save Them
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                //If There's An Error, Print It
                print("Error - Could Not Save")
            }
        }
    }
}
