//
//  LabelUIView.swift
//  FirstProjectIOS
//
//  Created by Rodrigo Martin on 18/05/25.
//

import SwiftUI

struct LabelUIView: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
            Label(LocalizedStringKey("Hello"), systemImage: "figure.wave")
            Label(LocalizedStringKey("Hello"), systemImage: "figure.wave")
            Label(
                title: {Text("Hello")},
                icon: { Image("logo_swift")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                }
            )
        }
    }
}

#Preview {
    LabelUIView()
}
