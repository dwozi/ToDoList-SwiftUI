//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Hakan Hardal on 17.02.2024.
//

import SwiftUI
import FirebaseCore

@main
struct ToDoListApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
