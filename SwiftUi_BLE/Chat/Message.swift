//
//  Message.swift
//  SwiftUI_BLE
//
//  Created by Al on 03/11/2023.
//

import Foundation

struct Message: Identifiable, Codable {
    var id = UUID()
    var user: String
    var content: String
    
    enum EncodeError : Error {
        case CanNoTEncodeError
    }
    
    
    func encodeMessage() throws -> Data {        
        guard let encoder = try? JSONEncoder().encode(self) else {
            throw EncodeError.CanNoTEncodeError
        }
        return encoder
    }
}

extension Message {
    
    static func defaultRandomUserMessage() -> Message{
        return Message(user: "User \(Int.random(in: 0...10))", content: "Salut!")
    }
}

