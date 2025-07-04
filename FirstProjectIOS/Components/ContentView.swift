//
//  ContentView.swift
//  FirstProjectIOS
//
//  Created by Rodrigo Martin on 14/05/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Text("Hello, world!")
            Text("Hello, world!")
            Text("Hello, world!").padding(.bottom,60)
            Text("Hello, world!")
            Text("Hello, world!").frame(width: 100, height: 200)
            Text("Hello, world!").bold()
            Button( action: {},
                    label: {Text("Hola")})
            HStack{
                Rectangle().frame( height :100)
                Rectangle().frame( height : 100)
                Rectangle().frame( height : 100)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
