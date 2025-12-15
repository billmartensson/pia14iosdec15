//
//  Item.swift
//  pia14iosdec15
//
//  Created by BillU on 2025-12-15.
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
