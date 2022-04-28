//
//  BookTrackerApp.swift
//  BookTracker
//
//  Created by KET on 28/04/2022.
//

import SwiftUI

@main
struct BookTrackerApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
