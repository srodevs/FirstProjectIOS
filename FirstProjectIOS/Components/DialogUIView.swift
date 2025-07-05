//
//  DialogUIView.swift
//  FirstProjectIOS
//
//  Created by Rodrigo Martin on 05/07/25.
//

import SwiftUI

struct DialogUIView<Content:View>: View {
    let closeDialog:()->Void
    let onDissmissOutside:Bool
    let content:Content
    
    var body: some View {
        ZStack{
            Rectangle().fill(.gray.opacity(0.7))
                .ignoresSafeArea()
                .onTapGesture {
                    if onDissmissOutside {
                        withAnimation(){
                            closeDialog()
                        }
                    }
                }
            
            content
                .frame(width: UIScreen.main.bounds.width-100, height: 300)
                .padding()
                .background(.white)
                .cornerRadius(16)
                .overlay(alignment:.topTrailing) {
                    Button(action: {
                        withAnimation(){
                            closeDialog()
                        }
                    }) {
                        Image(systemName: "xmark.circle.fill")
                    }.foregroundColor(.gray).padding(16)
                }
        }.ignoresSafeArea()
            .frame(
                width: UIScreen.main.bounds.size.width,
                height: UIScreen.main.bounds.size.height,
                alignment: .center
            )
    }
}
