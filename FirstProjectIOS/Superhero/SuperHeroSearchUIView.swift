//
//  SuperHeoSearchUIView.swift
//  FirstProjectIOS
//
//  Created by Rodrigo Martin on 12/06/25.
//

import SwiftUI
//import SDWebImageSwiftUI
//import SDWebImage

struct SuperHeroSearchUIView: View {
    @State var  superHeroName: String = ""
    @State var wrapper:ApiNetwork.Wrapper? = nil
    @State var loading: Bool = false
    
    var body: some View {
        VStack{
            TextField( "Search SuperHero",text: $superHeroName, prompt: Text("Buscar...").font(.title2).bold().foregroundColor(.gray))
                .font(.title2)
                .bold()
                .foregroundStyle(.gray)
                .padding(16)
                .border(.purple, width: 1.1)
                .padding(8)
                .autocorrectionDisabled()
                .onSubmit {
                    loading = true
                    Task{
                        do{
                            wrapper = try await ApiNetwork().getSuperHeroQuery(query: superHeroName)
                            
                        }catch {
                            print(error)
                        }
                        loading = false
                    }
                    print(superHeroName)
                }
            
            if loading {
                ProgressView()
            }
            
            NavigationStack{
                List(wrapper?.results ?? []){ superHeroName in
                    ZStack{
                        SuperHeroItemUiView(superHeroName: superHeroName)
                        //                Text(superHeroName.name)
                        NavigationLink(destination: {SuperHeroDetailUIView(superHeroId: superHeroName.id)}){EmptyView()}.opacity(0)
                    }
                }.listStyle(.plain)
            }
        }
    }
}

struct SuperHeroItemUiView: View {
    var superHeroName: ApiNetwork.SuperHero
    
    var body: some View {
        ZStack{
            AsyncImage(url: URL(string: superHeroName.image.url))
                .frame(width: 200, height: 200)
            //            WebImage(superHeroName.image.url)
            //                .resizable()
            //                .indicator(.activity)
            //                .aspectRatio(contentMode: .init(rawValue: 3))
            //                .frame(width: 2000, height: 150)
            //                .cornerRadius(12)
            VStack{
                Spacer()
                Text(superHeroName.name)
                    .font(.title2)
                    .bold()
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.red.opacity(   0.2))
            }
        }.frame(height: 200).cornerRadius(12)
    }
}


#Preview {
    SuperHeroSearchUIView()
}

//e8e79b5d70438c8e35f1db72fe5a3d9e
