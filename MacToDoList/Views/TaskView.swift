//
//  TaskView.swift
//  MacToDoList
//
//  Created by Nikhil Tyagi on 07/02/26.
//

import SwiftUI

struct TaskView: View {
    @Binding var task: TaskModel
    
    var colorBand: Color {
        switch task.priority {
        case .low:
            return Color.blue
        case .medium:
            return Color.green
        case .high:
            return Color.red
        }
    }
    
    var printPriority: String {
        switch task.priority {
        case .low:
            return "Low"
        case .medium:
            return "Medium"
        case .high:
            return "High"
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    HStack {
                        if !task.isCompleted{
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
                        Text(printPriority)
                    }.frame(width: 100, height: 30)
                        .padding(.horizontal)
                }
            }.foregroundStyle(.black)
            
        }
    }
}

#Preview {
    TaskView(task: .constant(TaskModel(name: "", priority: .high)))
}
