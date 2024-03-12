//
//  MainViewViewModel.swift
//  ToDoList
//
//  Created by Hakan Hardal on 17.02.2024.
//
import FirebaseAuth
import Foundation
class MainViewViewModel : ObservableObject{
    @Published var currentUserId: String = ""
    private var handler : AuthStateDidChangeListenerHandle?
    init(){
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            self?.currentUserId = user?.uid ?? ""
        }
        
    }
    
    public var isSignedIn : Bool{
        return Auth.auth().currentUser != nil
    }
}
