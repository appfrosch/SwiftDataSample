//
//  Item.swift
//  SwiftDataSample
//
//  Created by Andreas Seeger on 23.10.2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
