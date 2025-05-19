//
//  ImageUIView.swift
//  FirstProjectIOS
//
//  Created by Rodrigo Martin on 18/05/25.
//

import SwiftUI

struct ImageUIView: View {
    var body: some View {
        VStack {
            Image("logo_swift")
            Image("logo_swift")
            Image(systemName: "figure.walk")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 40)
            Image("swift_png")
                .resizable()
                .scaledToFit()
                .scaledToFill()
                .frame(width: 100, height: 200)
        }
    }
}

#Preview {
    ImageUIView()
}
