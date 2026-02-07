//
//  AddTaskSheetView.swift
//  MacToDoList
//
//  Created by Nikhil Tyagi on 07/02/26.
//

import SwiftUI

struct AddTaskSheetView: View {
    @Binding var tasks: [TaskModel]
    @State private var taskTitle = ""
    @State private var selectedTaskPriority: TaskPriorityType = .low
    @State private var showAlert: Bool = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @Environment(\.dismiss) var dismiss
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    var body: some View {
        VStack {
            Spacer()
            
            if horizontalSizeClass == .regular &&
                verticalSizeClass == .compact ||
                horizontalSizeClass == .compact &&
                verticalSizeClass == .compact
            {//To make "X" button appear on the top right corner to dismiss the add task view in landscpe mode, else it doesn't appear.
                HStack {
                    Spacer()
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundStyle(.black)
                    })
                }.padding()
            }
            
            VStack {
                VStack(alignment: .leading) {
                    Text("Task Title")
                        .font(.system(size: 20, weight: .semibold))
                        
                    TextField("Enter Task", text: $taskTitle)
                        .font(.system(size: 15))
                        .textFieldStyle(.roundedBorder)
                }
                .padding(.horizontal, 20)
                .padding(.top)
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Priority")
                        .font(.system(size: 20, weight: .semibold))
                            
                        Picker("Priority", selection: $selectedTaskPriority) {
                            ForEach(TaskPriorityType.allCases) { taskPriority in
                                Text(taskPriority.priority)
                                    .tag(taskPriority)
                            }
                        }
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                    .padding(.top)
                }
            }.foregroundStyle(.black)
                .padding(.top)
            
            Button(action: {
                guard taskTitle.count >= 2 else {
                    showAlert = true
                    alertTitle = "Title too short"
                    alertMessage = "Please input a larger title"
                    return
                }
                let task = TaskModel(name: taskTitle, priority: selectedTaskPriority)
                tasks.append(task)
                dismiss()
            }, label: {
                Text("Add Task")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                    .background(.primaryLightGreen)
                    .padding(.horizontal, 20)
                    .padding(.top, 10)
            })
            Spacer()
        }
        .alert(alertTitle, isPresented: $showAlert) {
            Button(action: {}, label: {Text("OK")})
        } message: {
            Text(alertMessage)
        }
    }
}

#Preview {
    AddTaskSheetView(tasks: .constant([]))
}

