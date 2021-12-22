//
//  ToDoListCoreDataFaceIDApp.swift
//  ToDoListCoreDataFaceID
//
//  Created by Marek Roslik on 23.12.21.
//

import SwiftUI

@main
struct ToDoListCoreDataFaceIDApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
