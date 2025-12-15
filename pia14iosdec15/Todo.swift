//
//  Todo.swift
//  pia14iosdec15
//
//  Created by BillU on 2025-12-15.
//

import Foundation
import SwiftData

@Model
class Todo {
    var tododescription = ""
    var duedate : Date?
    var tododone = false
    
    init() {
        
    }
}
