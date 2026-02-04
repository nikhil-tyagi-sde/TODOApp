//
//  TaskPriorityType.swift
//  ToDoList
//
//  Created by Nikhil Tyagi on 03/02/26.
//

import Foundation

enum TaskPriorityType: String, CaseIterable, Identifiable {
    case low, medium, high
    var id: Self {self}
    
    var priority: String {
        switch self {
        case .low: return "Low"
        case .medium: return "Medium"
        case .high: return "High"
        }
    }
}


