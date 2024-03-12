//
//  ToDoListItemViewViewModel.swift
//  ToDoList
//
//  Created by Hakan Hardal on 17.02.2024.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth
/// ViewModel for single to do list item view (each row in items list)
/// primary tab
class ToDoListItemViewViewModel : ObservableObject{
    init(){ }
    
    func toggleIsDone(item : ToDoListItem){
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        guard let uid = Auth.auth().currentUser?.uid else {
            return
            
        }
        let db = Firestore.firestore()
        db.collection("users").document(uid).collection("todos").document(itemCopy.id).setData(itemCopy.asDictionary())
    }
}
