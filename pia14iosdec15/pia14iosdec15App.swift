//
//  pia14iosdec15App.swift
//  pia14iosdec15
//
//  Created by BillU on 2025-12-15.
//

import SwiftUI
import SwiftData

@main
struct pia14iosdec15App: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self, Todo.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
