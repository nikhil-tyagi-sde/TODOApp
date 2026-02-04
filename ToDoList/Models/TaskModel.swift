//
//  TaskModel.swift
//  ToDoList
//
//  Created by Nikhil Tyagi on 03/02/26.
//

import Foundation

struct TaskModel: Identifiable, Hashable{
    let id = UUID()
    let name: String
    let priority: TaskPriorityType
    var isCompleted: Bool = false
}
