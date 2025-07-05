//
//  MapsUIView.swift
//  FirstProjectIOS
//
//  Created by Rodrigo Martin on 04/07/25.
//

import SwiftUI
import MapKit

struct MapsUIView: View {
    
    @State var position = MapCameraPosition.region(MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: -33.8688, longitude: 151.2093),
        span:   MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    ))
    
    var body: some View {
        ZStack{
            
            MapReader{pMapReader in
                Map(position: $position){
                    Marker("Place holder1", coordinate: CLLocationCoordinate2D(latitude: -33.8688, longitude: 151.2093))
                    Annotation("Place holder2", coordinate: CLLocationCoordinate2D(latitude: -33.8789, longitude: 151.2093) , content: {Circle().fill(Color.red)})
                }
                    .mapStyle(.hybrid(elevation: .realistic, showsTraffic: true))
                //                .onMapCameraChange{pCameraChange in
                //                    print("Camera changed: \(pCameraChange)")
                //                }
                    .onMapCameraChange(frequency: .continuous) {pCameraChange in
                        print("Camera changed: \(pCameraChange)")
                    }
                    .onTapGesture {pGesture in
                        if let coordinates = pMapReader.convert(pGesture, from: .local){
                            withAnimation(){
                                position = MapCameraPosition.region(MKCoordinateRegion(
                                    center: CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude),
                                    span:   MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
                                ))
                            }
                        }
                    }
            }
            
            
            VStack{
                Spacer()
                HStack{
                    Button("Zoom In"){
                        withAnimation(.easeInOut(duration: 0.5)){
                            position = MapCameraPosition.region(MKCoordinateRegion(
                                center: CLLocationCoordinate2D(latitude: -31.8688, longitude: 151.2093),
                                span:   MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
                            ))
                        }
                    }.cornerRadius(50).padding(12).background(.white).padding()
                    Button("Zoom Out"){
                        withAnimation(){
                            position = MapCameraPosition.region(MKCoordinateRegion(
                                center: CLLocationCoordinate2D(latitude: -33.8688, longitude: 151.2093),
                                span:   MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
                            ))
                        }
                    }.cornerRadius(12).padding(12).background(.white).padding()
                }
            }
        }
    }
}

#Preview {
    MapsUIView()
}
