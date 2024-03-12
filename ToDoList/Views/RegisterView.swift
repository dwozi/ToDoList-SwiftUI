//
//  RegisterView.swift
//  ToDoList
//
//  Created by Hakan Hardal on 17.02.2024.
//

import SwiftUI

struct RegisterView: View {
   @StateObject var viewModel = RegisterViewViewModel()
    var body: some View {
        VStack{
            HeaderView(title: "Register",
                       subTitle: "Start organizing your plans",
                       angle: 15,
                       backgroundColor: .purple)
            
            
            Form{
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                   
                    .autocorrectionDisabled()
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    
                    .textInputAutocapitalization(.none)
                    .autocorrectionDisabled()
                SecureField("Password",text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
             
                TLButton(
                    title: "Create Account",
                    backgroundColor: .green
                ){
                    //ATTEMPT Registration
                    viewModel.register()
                }
                .padding()

            }
            .offset(y: -50)
            
            Spacer()
        }
        
    }
}

#Preview {
    RegisterView()
}
