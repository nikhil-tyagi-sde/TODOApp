//
//  ContentView.swift
//  ToDoList
//
//  Created by Nikhil Tyagi on 03/02/26.
//

import SwiftUI

struct HomeView: View {
    @State private var tasks: [TaskModel] = []
    @State private var showSheet = false
    @State private var taskCompleted: Bool = false
    @State private var taskToComplete: TaskModel?
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showAlert: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack(alignment: .leading) {
                    List {
                        ForEach($tasks) { $task in//Here we are binding the task element to an array.
                            Button(action: {
                                task.isCompleted.toggle()
//                                if let indexOfTask = tasks.firstIndex(where: {$0.id == task.id}) {
//                                    tasks[indexOfTask] = TaskModel(name: task.name, priority: task.priority, isCompleted: !task.isCompleted)
//                                } else {
//                                    alertTitle = "Something went wrong"
//                                    alertMessage = "Cannot complete the task right now."
//                                    return
//                                }
                            }, label: {
                                TaskView(task: $task)
                            })
                        }.onDelete(perform: delete)
                    }
                }
                .navigationTitle("Tasks")}
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        showSheet = true
                    }, label: {
                        Image(systemName: "plus")
                    })
                }
            }.sheet(isPresented: $showSheet, content: {
                AddTaskSheetView(tasks: $tasks)
            })
        }
    }
    
    private func delete(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
}

#Preview {
    HomeView()
}
