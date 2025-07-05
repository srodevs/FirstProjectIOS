//
//  ApiNetwork.swift
//  FirstProjectIOS
//
//  Created by Rodrigo Martin on 04/07/25.
//


import Foundation
class ApiNetwork {
    
    // superHero
    struct Wrapper:Codable{
        let response: String
        let results: [SuperHero]
    }
    
    struct SuperHero: Codable, Identifiable {
        let id: String
        let name: String
        let image: ImageSuperHero
    }
    
    struct ImageSuperHero: Codable {
        let url: String
    }
    
//    SuperHeroDEtail
    struct SuperheroDetail: Codable {
        let id: String
        let name: String
        let image: ImageSuperHero
        let powerstats: Powerstats
        let biography: BiographySuper
    }
    
    struct Powerstats: Codable {
        let intelligence: String
        let strength: String
        let speed: String
        let durability: String
        let power: String
        let combat: String
    }
    
    struct BiographySuper: Codable {
        let alignment: String
        let aliases: [String]
        let publisher: String
        let fullName: String
        let alterEgos: String
        
        enum CodingKeys: String, CodingKey {
            case fullName = "full-name"
            case alterEgos = "alter-egos"
            case alignment = "alignment"
            case aliases = "aliases"
            case publisher = "publisher"
            
        }
    }
    
    func getSuperHeroQuery(query: String) async throws -> Wrapper {
        let url = URL(string: "https://superheroapi.com/api/e8e79b5d70438c8e35f1db72fe5a3d9e/search/\(query)")!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let wrapper = try JSONDecoder().decode(Wrapper.self, from: data)
        return wrapper
    }
    
    func getSuperHeroById(id: String) async throws -> SuperheroDetail {
        let url = URL(string: "https://superheroapi.com/api/e8e79b5d70438c8e35f1db72fe5a3d9e/\(id)")!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let superHero = try JSONDecoder().decode(SuperheroDetail.self, from: data)
        return superHero
    }
}
