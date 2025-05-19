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

// Para los componenetes ->shit + command + l /simbolo +
//refactor de code-> command +a -> control + i
//mover linea -> option + command + []
//mover entre ficheros -> commnad + shift + []
// poner teclado en simulador -> command + shift + k

//shift + command + l ->more
// ⌥ ⌘ E ->to select next occurence of currently selected
// ⌥ ⇧ ⌘ E ->to select previous occurence of currently selected
// ⌥ ⌘ G ->to find and select next
// ⌥ ⇧ ⌘ G ->to find and select previous
