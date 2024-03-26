//
//  Landmark2App.swift
//  Landmark2
//
//  Created by Sam Davenport on 3/25/24.
//

import SwiftUI

@main
struct Landmark2App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
