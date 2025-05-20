//
//  ImcResultUIView.swift
//  FirstProjectIOS
//
//  Created by Rodrigo Martin on 19/05/25.
//

import SwiftUI

struct ImcResultUIView: View {
    var weight: Double
    var height: Double
    
    var body: some View {
        VStack{
            
            Text("Resultado de ti IMC")
            let res = resultCalculate(weight: weight, height: height)
            BodyResultUIView(mResult: res)
        }
    }
}

func resultCalculate(weight: Double , height: Double )->Double{
    return  weight / ((height/100) * (height/100))
}

struct BodyResultUIView: View {
    let mResult: Double
    
    var body: some View {
        
        let imcResultColor = getImcResultColor(imcResult: mResult)
        
        Spacer()
        Text(imcResultColor.0).font(.largeTitle).foregroundStyle(imcResultColor.2)
        Text("\(mResult, specifier: "%.2f")").font(.system(size: 44)).padding(.vertical, 28)
        Text(imcResultColor.1).font(.caption).padding(.horizontal, 12)
        Spacer()
    }
}

func getImcResultColor(imcResult: Double) -> (String, String, Color) {
    let title: String
    let description: String
    let color: Color
    
    switch imcResult {
    case 0.00...19.99:
        title = "Bajo peso"
        description = "Debes aumentar el consumo de alimentos ricos en proteínas, grasas saludables y fibras."
        color = .yellow
    case 20.00...24.99:
        title = "Peso normal"
        description = "Tu consumo de alimentos es adecuado."
        color = .green
    case 25.00...29.99:
        title = "Sobrepeso"
        description = "Estas un poco por encima de tu peso ideal. Considera reducir el consumo de alimentos procesados."
        color = .yellow
    case 30.00...100:
        title = "Obesidad"
        description = "Tu consumo de alimentos es demasiado alto. Considera reducir el consumo de alimentos procesados."
        color = .red
    default:
        title = "ERROR"
        description = "Ha ocurrido un error."
        color = .gray
    }
    return (title, description, color)
}

#Preview {
    ImcResultUIView(weight: 20, height: 20)
}
