//
//  ChatViewModel.swift
//  SwiftUi_BLE
//
//  Created by digital on 03/11/2023.
//

import Foundation

class ChatViewModel:ObservableObject {
    
    @Published var username:String = "Mathis"
    @Published var messages:[Message] = []
    
    func listen() {
        BLEManager.instance.listenForMessages() { data in
            if let d = data{
                let message = try? JSONDecoder().decode(Message.self, from: d)
                self.messages.append(message!)
            }
        }
    }
    
    func send(message:Message) {
        guard let data = try? message.encodeMessage() else { return }
        BLEManager.instance.sendData(data: data)
    }
    
}

extension ChatViewModel {
    static func defaultChatViewModel() -> ChatViewModel {
        let instance = ChatViewModel()
        instance.username = "Mathis"
        instance.messages = [
            Message.defaultRandomUserMessage(),
            Message.defaultRandomUserMessage()
        ]
        return instance
    }
}
