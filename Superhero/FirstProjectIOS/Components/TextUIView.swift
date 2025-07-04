//
//  TextUIView.swift
//  FirstProjectIOS
//
//  Created by Rodrigo Martin on 18/05/25.
//

import SwiftUI

struct TextUIView: View {
    var body: some View {
        VStack{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/).font(Font.largeTitle)
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .font(.system(size: 40, weight: .bold, design: .monospaced).bold().italic().lowercaseSmallCaps())
                    .underline()
                .foregroundStyle(.white)
                .background(.black)
            Text("asdasda sd asd asd asd asd as d")
                .frame(width: 50)
                .lineLimit(2)
                .lineSpacing(20)
        }
    }
}

#Preview {
    TextUIView()
}
