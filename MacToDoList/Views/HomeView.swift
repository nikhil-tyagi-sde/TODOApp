//
//  ContentView.swift
//  MacToDoList
//
//  Created by Nikhil Tyagi on 07/02/26.
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
                            }, label: {
                                TaskView(task: $task)
                            })
                        }.onDelete(perform: delete)
                    }
                }
            }
            .navigationTitle("Tasks")}
        .toolbar {
            ToolbarItem(placement: .navigation) {
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
    
    private func delete(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
}

#Preview {
    HomeView()
}
