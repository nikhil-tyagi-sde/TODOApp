//
//  MacToDoListApp.swift
//  MacToDoList
//
//  Created by Nikhil Tyagi on 07/02/26.
//

import SwiftUI

@main
struct MacToDoListApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .preferredColorScheme(.light)
        }
    }
}
