//
//  MapFavUIView.swift
//  FirstProjectIOS
//
//  Created by Rodrigo Martin on 05/07/25.
//

import SwiftUI
import MapKit

struct MapFavUIView: View {
    @State var position = MapCameraPosition.region(MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 19.4205088, longitude: -99.1559832),
        span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)))
    
    @State var places:[PlaceModel] = []
    @State var showDialog:CLLocationCoordinate2D? = nil
    @State var name:String = ""
    @State var addFav:Bool = false
    @State var showSheet:Bool = false
    
    let heightSheet = stride(from: 0.3, through: 0.3, by: 0.1).map { PresentationDetent.fraction( $0) }
    
    var body: some View {
        ZStack{
            MapReader{ pReader in
                Map(position: $position){
                    ForEach(places){ pPlace in
                        Annotation(pPlace.name, coordinate: pPlace.coordinates){
                            let color = if pPlace.fav{Color.red} else {Color.blue}
                            Circle()
                                .stroke(color, lineWidth: 4)
                                .fill(.white)
                                .frame(width: 28, height: 28)
                        }
                    }
                }.onTapGesture(){ pMap in
                    if let coordinates = pReader.convert(pMap, from: .local){
                        showDialog = coordinates
                    }
                }
                .overlay(){
                    VStack{
                        Button("Show Sheet"){
                            showSheet = true
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(.white)
                        .cornerRadius(8)
                        .shadow(radius: 8)
                        .padding(16)
                        
                        Spacer()
                    }
                }
                
                if showDialog != nil{
                    let view = VStack{
                        Text("Agregar Lugar").font(.title2).bold().padding(.top, 12).foregroundColor(.black)
                        Spacer()
                        TextField("Nombre", text: $name)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)
                            .foregroundColor(.black)
                        Toggle(isOn: $addFav){
                            Text("Agregar a favoritos").foregroundColor(.black)
                        }
                        Spacer()
                        Button("Guardar"){
                            if !name.isEmpty{
                                savePlace(name: name, addFav: addFav, coordinate: showDialog!)
                                clearData()
                            } 
                        }.padding(.bottom, 8)
                    }
                    withAnimation(){
                        DialogUIView(
                            closeDialog: {
                                showDialog = nil
                            },
                            onDissmissOutside: true,
                            content: view,
                        )
                    }
                }
            }
        }.sheet(isPresented: $showSheet) {
            ScrollView(.horizontal){
                LazyHStack{
                    ForEach(places){ pPlace in
                        let colorStroke = pPlace.fav ? Color.yellow.opacity(0.4) : Color.black.opacity(0.4)
                     
                        VStack{
                            Text(pPlace.name)
                        }.frame(width: 100, height: 60)
                            .overlay(){
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(colorStroke, style: StrokeStyle(lineWidth: 1))
                            }
                            .shadow(radius: 4)
                            .padding(.horizontal, 12)
                            .onTapGesture {
                                animateToSelection(coordinate: pPlace.coordinates)
                                showSheet = false
                            }
                    }
                }
            }.presentationDetents(Set(heightSheet))
        }.onAppear(){
            loadPlace()
        }
    }
    
    func savePlace(name:String, addFav:Bool, coordinate:CLLocationCoordinate2D){
        let place = PlaceModel(id: UUID().self, name: name, fav: addFav, coordinates: coordinate)
        places.append(place)
        savePlace()
    }
    
    func clearData(){
        showDialog = nil
        name = ""
        addFav = false
    }
    
    func animateToSelection(coordinate:CLLocationCoordinate2D){
        withAnimation(){
            position =  MapCameraPosition.region(MKCoordinateRegion(
                center: coordinate,
                span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)))
        }
    }
}

extension MapFavUIView {
   func savePlace() {
        if let encodeData = try? JSONEncoder().encode(places) {
            UserDefaults.standard.set(encodeData, forKey: "favPlace")
       }
    }
    
    func loadPlace() {
        if let decodeData = UserDefaults.standard.data(forKey: "favPlace") {
            if let decodePlaces = try? JSONDecoder().decode([PlaceModel].self, from: decodeData) {
                places = decodePlaces
            }
        }
    }
}


#Preview {
    MapFavUIView()
}
