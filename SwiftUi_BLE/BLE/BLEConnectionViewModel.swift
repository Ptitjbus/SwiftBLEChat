//
//  BLEConnectionViewModel.swift
//  SwiftUi_BLE
//
//  Created by digital on 03/11/2023.
//

import Foundation
import CoreBluetooth

class BLEConnectionViewModel: ObservableObject {
    
    @Published var bleObjects:[BLEObjectViewModel] = []
    @Published var connectedBLEObject: BLEObjectViewModel?
    @Published var isScanning = false
    
    func addNewBLEObject(bleObject:BLEObjectViewModel) {
        if !bleObjects.contains(bleObject) {
            bleObjects.append(bleObject)
        }
    }
    
    func startScan(){
        isScanning = true
        BLEManager.instance.scan { periph, name in
            self.addNewBLEObject(bleObject: BLEObjectViewModel(name: name, periph: periph))
        }
    }
    
    func stopScan(){
        BLEManager.instance.stopScan()
        isScanning = false
    }
    
    func disconnect(bleObject:BLEObjectViewModel){
        if let periph = bleObject.periph{
            BLEManager.instance.disconnectPeripheral(periph) { periph in
                self.connectedBLEObject = nil
            }
        }
    }
    
    func connect(bleObject:BLEObjectViewModel){
        if let periph = bleObject.periph{
            BLEManager.instance.connectPeripheral(periph) { connectedPeriph in
                self.connectedBLEObject = bleObject
            }
        }
        
    }
    
}

extension BLEConnectionViewModel {
    
    static func defaultBLEConnectionViewModel() -> BLEConnectionViewModel {
        var objectList = (0..<10).map{ BLEObjectViewModel(name: "prout \($0)")}
        let instance = BLEConnectionViewModel()
        instance.bleObjects = objectList
        return instance
    }
    
    static func defaultEmptyBLEConnectionViewModel() -> BLEConnectionViewModel {
        var objectList = (0..<0).map{ BLEObjectViewModel(name: "prout \($0)")}
        let instance = BLEConnectionViewModel()
        instance.bleObjects = objectList
        return instance
    }
    
    static func defaultBigBLEConnectionViewModel() -> BLEConnectionViewModel {
        var objectList = (0..<100).map{ BLEObjectViewModel(name: "prout \($0)")}
        let instance = BLEConnectionViewModel()
        instance.bleObjects = objectList
        return instance
    }
}
