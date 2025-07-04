//
//  TextFieldUIView.swift
//  FirstProjectIOS
//
//  Created by Rodrigo Martin on 18/05/25.
//

import SwiftUI

struct TextFieldUIView: View {
    @State var email = ""
    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .keyboardType( .emailAddress)
                .padding(16)
                .background(.gray.opacity(0.2))
                .cornerRadius(12)
                .padding(.horizontal, 32)
                .onChange(of: email)   {old, new in
                    print("email changed: \(new), el viejo era \(old)")}
        SecureField("Contraseña", text: $email)
                .keyboardType( .emailAddress)
                .padding(16)
                .background(.gray.opacity(0.2))
                .cornerRadius(12)
                .padding(.horizontal, 32)
                .onChange(of: email)   {old, new in
                    print("email changed: \(new), el viejo era \(old)")}
        }
    }
}

#Preview {
    TextFieldUIView()
}
