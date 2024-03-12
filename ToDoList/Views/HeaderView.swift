//
//  HeaderView.swift
//  ToDoList
//
//  Created by Hakan Hardal on 17.02.2024.
//

import SwiftUI

struct HeaderView: View {
    let title : String
    let subTitle : String
    let angle : Double
    let backgroundColor : Color
    
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(backgroundColor)
                .rotationEffect(Angle(degrees: angle))
                
            
            VStack{
                
                Text(title)
                    .foregroundStyle(.white)
                    .font(.system(size: 50, weight: .bold))
                    
                    
                Text(subTitle)
                    .foregroundStyle(.white)
                    .font(.system(size: 30))
                    
            }
            .padding(.top, 60)

            
        }
        .frame(width: UIScreen.main.bounds.width*3, height: 330, alignment: .center)
        .offset(y: -140)
        

    }
}

#Preview {
    HeaderView(title: "Title", subTitle: "Subtitle", angle: 15, backgroundColor: .blue)
}
