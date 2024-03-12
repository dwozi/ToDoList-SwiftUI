//
//  ProfileView.swift
//  ToDoList
//
//  Created by Hakan Hardal on 17.02.2024.
//

import SwiftUI
import FirebaseAuth

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    var body: some View {
        
        NavigationStack{
            
            VStack{
                if let user = viewModel.user{
                    //Avatar
                    profile(user: user)

                }else{
                    Text("Profile is loading...")
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear{
            viewModel.fetchUser()
        }
        
    }
    
    
    @ViewBuilder
    func profile(user: User)-> some View{
        
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundStyle(.blue)
            .frame(width: 125, height: 125, alignment: .center)
            .padding()
        //Info: name:email:membersince
        VStack(alignment:.leading){
            HStack{
                Text("Name:")
                    .bold()
                Text(user.name)
            }.padding()
            
            HStack{
                Text("Email:")
                    .bold()
                Text(user.email)
            }
            .padding()
            
            HStack{
                Text("Member Since:")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            .padding()
            
        }
        .padding()
        //signout
        Button("Log Out"){
            viewModel.logOut()
        }
        .tint(.red)
        .bold()
        .padding()
        Spacer()
        
    }
}

#Preview {
    ProfileView()
}
