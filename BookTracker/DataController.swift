//
//  DataController.swift
//  BookTracker
//
//  Created by KET on 28/04/2022.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "BookDataModel")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Failed to load \(error.localizedDescription)")
            }
        }
    }
}
