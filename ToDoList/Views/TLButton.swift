//
//  TLButton.swift
//  ToDoList
//
//  Created by Hakan Hardal on 17.02.2024.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let backgroundColor : Color
    let action: () -> Void
    var body: some View {
        Button{
            action()
        }label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(backgroundColor)
                Text(title)
                    .foregroundStyle(.white)
                    .bold()
            }
            
        }
        
        
       
    }
   
}

#Preview {
    TLButton(title: "Title",
             backgroundColor: .blue) {
        //Action
    }
}
