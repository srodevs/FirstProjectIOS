//
//  MenuUIView.swift
//  FirstProjectIOS
//
//  Created by Rodrigo Martin on 18/05/25.
//

import SwiftUI

struct MenuUIView: View {
    var body: some View {
        NavigationStack{
            List{
                Section("Componentes"){
                    NavigationLink(destination: ButtonUIView()){
                        Text("Button View")
                    }
                    NavigationLink(destination: ContentView()){
                        Text("Content View")
                    }
                    NavigationLink(destination: ImageUIView()){
                        Text("Image View")
                    }
                    NavigationLink(destination: LabelUIView()){
                        Text("Label View")
                    }
                    NavigationLink(destination: TextFieldUIView()){
                        Text("TextField View")
                    }
                    NavigationLink(destination: TextUIView()){
                        Text("Text View")
                    }
                    NavigationLink(destination: ListUIView()){
                        Text("Listas")
                    }
                    NavigationLink(destination: MapsUIView()){
                        Text("Maps")
                    }
                }
                Section("Apps"){
                    NavigationLink(destination: ImcUIView()){
                        Text("IMC Calculator")
                    }
                    NavigationLink(destination: SuperHeroSearchUIView()) {
                        Text("SuperHero")
                    }
                    NavigationLink(destination: MapFavUIView()) {
                        Text("Favorites places")
                    }
                }
                
            }
        }
    }
}

#Preview {
    MenuUIView()
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
