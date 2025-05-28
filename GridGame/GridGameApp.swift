//
//  GridGameApp.swift
//  GridGame
//
//  Created by Jason Vance on 5/26/25.
//

import SwiftUI
import SwiftData

@main
struct GridGameApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
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
            GameView()
        }
        .modelContainer(sharedModelContainer)
    }
}
