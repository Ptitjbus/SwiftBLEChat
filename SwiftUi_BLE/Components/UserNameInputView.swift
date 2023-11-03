//
//  UserNameInputView.swift
//  SwiftUI_BLE
//
//  Created by Al on 03/11/2023.
//

import Foundation
import SwiftUI

struct UsernameInputView: View {
    @Binding var username: String
    @Binding var isPopupVisible: Bool

    var body: some View {
        VStack(spacing: 20) {
            Text("Entrez votre nom d'utilisateur")
                .font(.headline)

            TextField("Nom d'utilisateur", text: $username)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)

            Button("Valider") {
                isPopupVisible = false
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding(20)
    }
}
