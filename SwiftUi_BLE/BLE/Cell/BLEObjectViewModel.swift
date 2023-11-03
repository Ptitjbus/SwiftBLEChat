//
//  BLEObjectModel.swift
//  SwiftUi_BLE
//
//  Created by digital on 03/11/2023.
//

import Foundation
import CoreBluetooth

struct  BLEObjectViewModel:ModelProtocol {
    var id = UUID().uuidString
    var name:String
    var periph:CBPeripheral?
}

extension BLEObjectViewModel {
    static func defaultBLEObjectViewModel() -> BLEObjectViewModel {
        return BLEObjectViewModel(name: "prout", periph: nil)
    }
}
