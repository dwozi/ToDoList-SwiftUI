//
//  ToDoListItemView.swift
//  ToDoList
//
//  Created by Hakan Hardal on 17.02.2024.
//

import SwiftUI
import FirebaseFirestoreSwift


struct ToDoListView: View {
    @StateObject var viewModel : ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    private let userId : String
    init(userId: String){
        self.userId = userId
        
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todos"
        )
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))
    }
    var body: some View {
        NavigationStack{
            VStack{
                List(items){item in
                    ToDoListItemView(item: item)
                        .swipeActions(edge: .trailing, allowsFullSwipe: true){
                            Button {
                                viewModel.deleteItem(id: item.id)
                            } label: {
                                Text("Delete")
                            
                            }
                            .tint(.red)
                           

                        }
                }
                .listStyle(PlainListStyle())
                 
            }
            .navigationTitle("To Do List")
            .toolbar{
                Button{
                    //Action
                    viewModel.showingNewItemView = true
                } label:{
                    Image(systemName: "plus")
                }
                .sheet(isPresented: $viewModel.showingNewItemView, content: {
                    NewItemView(newItemPresented: $viewModel.showingNewItemView)
                        
                })
            }
        }
    }
}

#Preview {
    ToDoListView(userId: "zjHroLXsKzdhnMPSKgC2o72BRXC3")
}
