//
//  SuperHeoSearchUIView.swift
//  FirstProjectIOS
//
//  Created by Rodrigo Martin on 12/06/25.
//

import SwiftUI

struct SuperHeroSearchUIView: View {
    @State var  superHeroName: String = ""
    
    var body: some View {
        VStack{
            TextField("Search SuperHero", text: $superHeroName)
                .padding().foregroundStyle(.cyan)
        }.frame(minWidth: .infinity, maxWidth: .infinity)
    }
}

#Preview {
    SuperHeroSearchUIView()
}
