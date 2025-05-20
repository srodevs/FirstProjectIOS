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
            VStack{
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
                NavigationLink(destination: ImcUIView()){
                    Text("IMC Calculator")
                }
                Text("App 1")
                Text("App 2")
                Text("App 3")
            }
        }
    }
}

#Preview {
    MenuUIView()
}
