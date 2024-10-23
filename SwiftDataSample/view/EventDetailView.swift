//
//  EventDetailView.swift
//  SwiftDataSample
//
//  Created by Andreas Seeger on 23.10.2024.
//

import SwiftUI

struct EventDetailView: View {
  @Bindable var event: Event

  var body: some View {
    Form {
      TextField("Title", text: $event.title)
    }
  }
}
