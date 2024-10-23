//
//  Item.swift
//  SwiftDataSample
//
//  Created by Andreas Seeger on 23.10.2024.
//

import Foundation
import SwiftData

@Model
final class Event: Identifiable {
  var id: UUID
  var title: String

  init(
    id: UUID = UUID(), //default value in init
    title: String
  ) {
    self.id = id
    self.title = title
  }
}
