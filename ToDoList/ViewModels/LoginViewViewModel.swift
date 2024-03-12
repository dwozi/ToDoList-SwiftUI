//
//  LoginViewViewModel.swift
//  ToDoList
//
//  Created by Hakan Hardal on 17.02.2024.
//
import FirebaseAuth
import Foundation
class LoginViewViewModel : ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var error = ""
   
    init(){}
    
    func login(){
        guard validate() else {
            return
        }
    //try log in
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    private func validate()-> Bool{
        error = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            error = "Please fill in all fields"
            
            return false
        }

        //email@foo.com

        guard email.contains("@") && email.contains(".") else{
            error = "Please enter Valid Email."
            return false
        }
        return true
    }
}
