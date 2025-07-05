//
//  SuperHeroDetailUIView.swift
//  FirstProjectIOS
//
//  Created by Rodrigo Martin on 04/07/25.
//

import SwiftUI
import Charts

struct SuperHeroDetailUIView: View {
    let superHeroId: String
    
    @State var superHero: ApiNetwork.SuperheroDetail? = nil
    @State var loading:Bool = false
    
    var body: some View {
        VStack{
            if(loading){
                ProgressView()
            } else if let superhero = superHero{
                AsyncImage(url: URL(string: superhero.image.url)!) .frame(width: .infinity, height: 200).clipped()
                Text(superhero.name)
                ForEach(superhero.biography.aliases, id: \.self){ alias in
                    Text(alias).foregroundStyle(.gray)
                }
                SuperHeroStats(stats:superhero.powerstats)
                Spacer()
            }
            
        }.onAppear(){
            Task{
                do {
                    superHero =   try await ApiNetwork().getSuperHeroById(id: superHeroId)
                }catch {
                    print(error)
                    superHero = nil
                }
                loading = false
            }
        }
    }
}

struct SuperHeroStats: View {
    var stats: ApiNetwork.Powerstats
    
    var body: some View {
        VStack{
            Chart{
                SectorMark(angle:.value("Count", Int(stats.intelligence) ?? 0 ),
                           innerRadius: .ratio(0.6),
                           angularInset: 5
                ).cornerRadius(4)
                    .foregroundStyle(by:.value("Category", "Intelligence"))
                SectorMark(angle:.value("Count", Int(stats.combat) ?? 0 ),
                           innerRadius: .ratio(0.6),
                           angularInset: 5
                ).cornerRadius(4)
                    .foregroundStyle(by:.value("Category", "Combat"))
                SectorMark(angle:.value("Count", Int(stats.durability) ?? 0 ),
                           innerRadius: .ratio(0.6),
                           angularInset: 5
                ).cornerRadius(4)
                    .foregroundStyle(by:.value("Category", "Durability"))
                SectorMark(angle:.value("Count", Int(stats.power) ?? 0 ),
                           innerRadius: .ratio(0.6),
                           angularInset: 5
                ).cornerRadius(4)
                    .foregroundStyle(by:.value("Category", "Power"))
                SectorMark(angle:.value("Count", Int(stats.speed) ?? 0 ),
                           innerRadius: .ratio(0.6),
                           angularInset: 5
                ).cornerRadius(4)
                    .foregroundStyle(by:.value("Category", "Speed"))
                SectorMark(angle:.value("Count", Int(stats.strength) ?? 0 ),
                           innerRadius: .ratio(0.6),
                           angularInset: 5
                ).cornerRadius(4)
                    .foregroundStyle(by:.value("Category", "Strength"))
            }
        }.cornerRadius(12)
            .padding(16)
    }
}


#Preview {
    SuperHeroDetailUIView(superHeroId: "s ")
}
