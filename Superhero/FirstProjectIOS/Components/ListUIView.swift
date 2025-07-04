//
//  ListUIView.swift
//  FirstProjectIOS
//
//  Created by Rodrigo Martin on 20/05/25.
//

import SwiftUI

let dbzList = [
    DragonBallModel(name: "Goku", power: 10000),
    DragonBallModel(name: "Gohan", power: 9000),
    DragonBallModel(name: "Vegeta", power: 8000),
    DragonBallModel(name: "Piccolo", power: 7000),
    DragonBallModel(name: "Krillin", power: 6000),
]

let pokemons: [Pokemon] = [
    .init(name: "Pikachu"),
    .init(name: "Charizard"),
    .init(name: "Squirtle"),
    .init(name: "Bulbasaur"),
    .init(name: "Jigglypuff"),
]


struct ListUIView: View {
    var body: some View {
        //        List{
        //            Text("Hello, World!")
        //            Text("Hello, World!")
        //            Text("Hello, World!")
        //            Text("Hello, World!")
        //        }
        //        List{
        //            ForEach(dbzList, id:\.name){ item in
        //                Text("\(item.name) - \(item.power)")
        //            }
        //        }
        //
        //        List(pokemons){ pokemon in
        //            Text(pokemon.name)
        //        }
        List{
            Section(header: Text("Dragon Ball Z")) {
                ForEach(dbzList, id:\.name){ item in
                    Text("\(item.name) - \(item.power)")
                }
            }
            Section(header: Text("Pokemon")) {
                ForEach(dbzList, id:\.name){ item in
                    Text("\(item.name) - \(item.power)")
                }
            }
            
        }.listStyle(.automatic)
    }
}

struct DragonBallModel{
    let name: String
    let power: Int
}

struct Pokemon:Identifiable {
    var id = UUID()
    let name: String
}

#Preview {
    ListUIView()
}
