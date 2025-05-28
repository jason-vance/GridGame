//
//  Item.swift
//  GridGame
//
//  Created by Jason Vance on 5/26/25.
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
