//
//  ChatBubble.swift
//  SwiftUi_BLE
//
//  Created by digital on 03/11/2023.
//

import SwiftUI

struct ChatBubbleView: View {
    var message: Message
    var username: String
    
    var body: some View {
        if message.user != username {
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(message.user)
                        .font(.headline)
                    Text(message.content)
                        .padding(10)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                }
                Spacer()
            }
        } else {
            HStack {
                Spacer()
                VStack(alignment: .leading, spacing: 5) {
                    Text("You")
                        .font(.headline)
                    Text(message.content)
                        .padding(10)
                        .background(Color.blue.opacity(0.2))
                        .cornerRadius(10)
                }
            }
        }
    }
}

#Preview {
    var model = ChatViewModel.defaultChatViewModel()
    return ChatBubbleView(message: model.messages[0], username: model.username)
}
