//
//  MyAppApp.swift
//  MyApp
//
//  Created by Robert Palmer on 6/20/23.
//

import SwiftUI

@main
struct MyAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
