//
//  TaskView.swift
//  ToDoList
//
//  Created by Nikhil Tyagi on 03/02/26.
//

import SwiftUI

struct TaskView: View {
    let task: TaskModel
    @State var priorityBar: TaskPriorityType
    @State var taskCompleted: Bool
    
    var colorBand: Color {
        switch priorityBar.priority {
        case "Low":
            return Color.blue
        case "Medium":
            return Color.green
        case "High":
            return Color.red
        default:
            return Color.gray
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    HStack {
                        if !taskCompleted{
                            Image(systemName: "circle")
                        } else {
                            ZStack {
                                Image(systemName: "circle")
                                Image(systemName: "checkmark")
                                    .resizable()
                                    .frame(width: 9, height: 7)
                                    .aspectRatio(contentMode: .fit)
                            }
                            
                        }
                        Text(task.name)
                            
                    }
                }
                Spacer()
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(colorBand)
                        Text(priorityBar.priority)
                    }.frame(width: 100, height: 30)
                        .padding(.horizontal)
                }
            }.foregroundStyle(.black)
            
        }
    }
}

#Preview {
    TaskView(task: TaskModel(name: "Dog Walk", priority: .high), priorityBar: .high, taskCompleted: false)
}
