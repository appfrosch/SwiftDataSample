//
//  SwiftDataSampleApp.swift
//  SwiftDataSample
//
//  Created by Andreas Seeger on 23.10.2024.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataSampleApp: App {
  var sharedModelContainer: ModelContainer = {
    let schema = Schema([
      Event.self,
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
