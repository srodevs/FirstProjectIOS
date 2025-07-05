//
//  Place.swift
//  FirstProjectIOS
//
//  Created by Rodrigo Martin on 05/07/25.
//

import Foundation
import MapKit

struct PlaceModel: Identifiable, Codable {
    var id = UUID()
    var name: String
    var fav: Bool
    var coordinates: CLLocationCoordinate2D
    
    enum CodingKeys: String, CodingKey {
        case id, name, fav, latitude, longitude
    }
    
    init(id: UUID, name: String, fav: Bool, coordinates: CLLocationCoordinate2D) {
        self.id = id
        self.name = name
        self.fav = fav
        self.coordinates = coordinates
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let latitude = try container.decode(CLLocationDegrees.self, forKey: .latitude)
        let longitude = try container.decode(CLLocationDegrees.self, forKey: .longitude)
        
        coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        name = try container.decode(String.self, forKey: .name)
        fav = try container.decode(Bool.self, forKey: .fav)
        id = try container.decode(UUID.self, forKey: .id)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(coordinates.latitude, forKey: .latitude)
        try container.encode(coordinates.longitude, forKey: .longitude)
        try container.encode(name, forKey: .name)
        try container.encode(fav, forKey: .fav)
        try container.encode(id, forKey: .id)
    }
}
