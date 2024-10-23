//
//  ContentView.swift
//  SwiftDataSample
//
//  Created by Andreas Seeger on 23.10.2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
  @Environment(\.modelContext) private var modelContext
  @Query private var events: [Event]

  var body: some View {
    NavigationSplitView {
      if events.isEmpty {
        ContentUnavailableView("No events yet …", systemImage: "circle.slash")
      }
      List {
        ForEach(events) { event in
          NavigationLink {
            EventDetailView(event: event)
          } label: {
            Text(event.title)
          }
        }
        .onDelete(perform: deleteItems)
      }
#if os(macOS)
      .navigationSplitViewColumnWidth(min: 180, ideal: 200)
#endif
      .toolbar {
#if os(iOS)
        ToolbarItem(placement: .navigationBarTrailing) {
          EditButton()
        }
#endif
        ToolbarItem {
          Button(action: addItem) {
            Label("Add Item", systemImage: "plus")
          }
        }
      }
    } detail: {
      Text("Select an item")
    }
  }

  private func addItem() {
    withAnimation {
      let newEvent = Event(title: "New Event")
      modelContext.insert(newEvent)
    }
  }

  private func deleteItems(offsets: IndexSet) {
    withAnimation {
      for index in offsets {
        modelContext.delete(events[index])
      }
    }
  }
}

#Preview {
  ContentView()
    .modelContainer(for: Event.self, inMemory: true)
}
