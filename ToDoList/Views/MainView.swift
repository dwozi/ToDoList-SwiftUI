//
//  ContentView.swift
//  ToDoList
//
//  Created by Hakan Hardal on 17.02.2024.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        if viewModel.isSignedIn,!viewModel.currentUserId.isEmpty{
            //signed In
            accountView()
        }else{
            LoginView()
        }
        
    }
    @ViewBuilder
    func accountView()-> some View {
        TabView{
            ToDoListView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Home",systemImage: "house")
                }
            ProfileView()
                .tabItem {
                    Label("Profile",systemImage: "person.circle")
                }
        }
    }
}

#Preview {
    MainView()
}
