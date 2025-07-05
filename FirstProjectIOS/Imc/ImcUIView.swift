//
//  ImcUIView.swift
//  FirstProjectIOS
//
//  Created by Rodrigo Martin on 18/05/25.
//

import SwiftUI

struct ImcUIView: View {
    
    //    init(){
    //        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.red]
    //    }
    @State var genderSelection: Int = 0
    @State var heightSelection: Double = 150
    @State var ageSelection: Int = 20
    @State var pesoSelection: Int = 50
    
    var body: some View {
        VStack{
            HStack{
                GenderTop(nameGender: "Hombre", nameImage: "figure.boxing", valueGender: 0, stateSelected:  $genderSelection)
                GenderTop(nameGender: "Mujer", nameImage: "figure.cooldown", valueGender: 1, stateSelected:  $genderSelection)
            }
            
            SliderHeight(selectedHeight: $heightSelection)
                .padding(.vertical, 24)
            
            HStack{
                BtnAgeHeight(titleAgeHeight: "Edad", valueAgeHeight: $ageSelection )
                BtnAgeHeight(titleAgeHeight: "Peso", valueAgeHeight: $pesoSelection )
            }.padding(.horizontal, 24)
            
            BtnCalcular(mWeight: Double(pesoSelection), mHeight: heightSelection)
        }.frame(maxWidth: .infinity, maxHeight:.infinity)
            .toolbar{
                ToolbarItem(placement: .principal, content: {
                    Text("Imc Calculator Title")
                }
                )
            }
        //            .navigationBarBackButtonHidden()
        //            .navigationTitle(Text("IMC Calculator - Rodrigo Martin"))
    }
}

struct GenderTop:View {
    let nameGender:String
    let nameImage:String
    let valueGender:Int
    @Binding var stateSelected:Int
    
    var body: some View {
        
        let colorSate = if(valueGender == stateSelected){
            Color.green
        }else{
            Color.graySelection
        }
        
        Button(action: {stateSelected = valueGender}){
            VStack{
                Image(systemName: nameImage)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .padding(.vertical, 12)
                
                TitleText(nameTitle: nameGender).padding(.bottom, 12)
            }
        }.frame(maxWidth: .infinity, maxHeight:.infinity).background(colorSate).cornerRadius(12)
        
    }
}

struct TitleText:View {
    let nameTitle:String
    
    var body: some View {
        Text(nameTitle)
            .font(.title)
            .fontWeight(.bold)
    }
}

struct SliderHeight: View {
    @Binding var selectedHeight:Double
    
    var body: some View {
        VStack{
            Text("Altura").padding(.top, 12).foregroundColor(.blue)
            TitleText(nameTitle: "\(Int(selectedHeight)) cm").foregroundColor(.blue)
            Slider(value: $selectedHeight, in: 100...200, step: 1)
                .padding(.bottom, 12)
                .padding(.horizontal, 12)
        }.background(Color.graySelection)
            .cornerRadius(12)
            .padding(.horizontal, 24)
    }
}

struct BtnAgeHeight: View {
    let titleAgeHeight:String
    @Binding var valueAgeHeight:Int
    
    var body: some View {
        VStack {
            Text(titleAgeHeight).padding(.top, 12).foregroundColor(.blue)
            TitleText(nameTitle: "\(valueAgeHeight)").padding(.vertical, 8).foregroundColor(.blue)
            HStack{
                Button(action: {
                    if(valueAgeHeight > 0){
                        valueAgeHeight -= 1
                    }
                }) {
                    Image(systemName: "minus").foregroundColor(Color.white)
                }.frame(width: 40, height: 40, alignment: Alignment.center)
                    .background(Color.blue)
                    .cornerRadius(20)
                Button(action: {
                    if(valueAgeHeight < 100){
                        valueAgeHeight += 1
                    }
                }) {
                    Image(systemName: "plus").foregroundColor(Color.white)
                }.frame(width: 40, height: 40, alignment: Alignment.center)
                    .background(Color.blue)
                    .cornerRadius(20)
            }.padding(.bottom, 12)
        }.padding(.horizontal, 40)
            .background(Color.graySelection)
            .cornerRadius(12)
    }
}

struct BtnCalcular: View {
    let mWeight: Double
    let mHeight: Double
    
    var body: some View {
        NavigationStack{
            NavigationLink(destination: ImcResultUIView(weight: mWeight, height: mHeight)){
                
                Text("Calcular")
                    .padding(.vertical, 12)
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 200, height: 60)
                    .background(Color.blue)
                    .cornerRadius(12)
                    .padding(.vertical, 24)
            }
        }
    }
}

#Preview {
    ImcUIView()
}
