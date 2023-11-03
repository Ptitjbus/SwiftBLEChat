//
//  ChatView.swift
//  SwiftUI_BLE
//
//  Created by Al on 03/11/2023.
//

import SwiftUI

struct ChatView: View {
    @State private var inputText: String = ""
    @State private var isUsernamePopupVisible: Bool = false
    @StateObject private var model = ChatViewModel.defaultChatViewModel()
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Chat")
                .font(.title)
                .padding(.top)
            
            List(model.messages) { message in
                ChatBubbleView(message: message, username: model.username)
            }.scrollContentBackground(.hidden)
            
            Spacer()

            TextField("Type your message...", text: $inputText, onCommit: {
                if !inputText.isEmpty {
                    model.send(message: Message(user: model.username, content: inputText))
                    inputText = ""
                }
            })
            .padding(10)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
            .padding(.horizontal)
        }.sheet(isPresented: $isUsernamePopupVisible) {
            UsernameInputView(username: $model.username, isPopupVisible: $isUsernamePopupVisible)
        }.onAppear(perform: {
            if let user = Storage.instance.getUsername() {
                model.username = user
            } else {
                isUsernamePopupVisible = true
            }
            model.listen()
        })
    }
}


#Preview {
    ChatView()
}
