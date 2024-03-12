//
//  LoginView.swift
//  ToDoList
//
//  Created by Hakan Hardal on 17.02.2024.
//

import SwiftUI

struct LoginView: View {
    @StateObject var  viewModel = LoginViewViewModel()
    
    var body: some View {
       
        NavigationStack{
            VStack{
                //Header----------------
                HeaderView(title: "To Do List",
                           subTitle: "Get things done",
                           angle: 15,
                           backgroundColor: .pink)
              
                
               
                //login Form---------------
                Form{
                    if !viewModel.error.isEmpty{
                        Text(viewModel.error)
                            .foregroundStyle(.red)
                    }
                    
                    TextField("Email Address",text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .textInputAutocapitalization(.none)
                        .autocorrectionDisabled()
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(title: "Log In", backgroundColor: .blue){
                
                        viewModel.login()
                    }
                    .padding()
                }
                .offset(y: -50)
                
                //create account---------------------------------
                VStack{
                    Text("New Around Here?")
                  
                   NavigationLink("Create An Account", destination: RegisterView())
                    
                    
                }
                .padding(.bottom, 20)
                Spacer()
            }
        }

    }
}

#Preview {
    LoginView()
}
