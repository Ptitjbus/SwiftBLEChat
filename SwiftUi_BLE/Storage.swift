//
//  Storage.swift
//  SwiftUI-BLE
//
//  Created by Mathieu DUBART on 03/11/2023.
//

import Foundation

class Storage {
    private let storage = UserDefaults.standard
    static let instance = Storage()
    
    func saveUsername(_ str: String) -> Void {
        storage.setValue(str, forKey: "username")
    }
    
    func getUsername() -> String? {
        if let username = storage.string(forKey: "username") {
            return username
        }
        
        return nil
    }
}
