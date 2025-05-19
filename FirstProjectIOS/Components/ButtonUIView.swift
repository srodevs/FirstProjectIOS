//
//  ButtonUIView.swift
//  FirstProjectIOS
//
//  Created by Rodrigo Martin on 18/05/25.
//

import SwiftUI

struct ButtonUIView: View {
    var body: some View {
        VStack{
            Button(LocalizedStringKey("Button")) {
                print("Hola mundo")
            }
            Button(action:{print("Hola mundo")}) {
                Text("Hola Mundo 2")
                    .frame(width: 140,height:  50)
                    .background(Color.blue)
                    .foregroundStyle(Color.white)
                    .cornerRadius(8)
            }
        }
    }
}

struct Counter:View {
    @State var total = 0
    var body: some View {
        Button(action:{
            total += 1
        }) {
            Text("Comentarios:  \(total)")
                .frame(height:  50)
                .background(Color.blue)
                
                .foregroundStyle(Color.white)
                .cornerRadius(8)
        }
    }
}

#Preview {
    Counter()
}
