//
//  ContentView.swift
//  SwiftUi_BLE
//
//  Created by digital on 03/11/2023.
//

import SwiftUI

struct BLEConnectionView: View {
    
    @StateObject var model = BLEConnectionViewModel.defaultEmptyBLEConnectionViewModel()
    @State var isConnected = false
    @State var selectedBLEObject:BLEObjectViewModel = BLEObjectViewModel.defaultBLEObjectViewModel()
    
    var body: some View {
        NavigationView{
            VStack(alignment: .trailing) {
                Text(model.isScanning ? "Stop" : "Scan").onTapGesture {
                    model.isScanning ? model.stopScan() : model.startScan()
                }.foregroundStyle(.blue)
                List(model.bleObjects) { bleObj in
                    NavigationLink(isActive: $isConnected, destination: {
                        ChatView()
                    }, label: {
                        BLEObjectView(model: bleObj).onTapGesture {
                            print("\(bleObj.name) was clicked")
                            model.connect(bleObject: bleObj)
                        }
                    })
                    
                    
                }.onChange(of: model.connectedBLEObject, perform: { value in
                    if value == nil {
                        isConnected = false
                    } else {
                        isConnected = true
                        model.stopScan()
                    }
                })
            }
            .navigationTitle("BLE Connections")
            .padding()
        }.onAppear(perform: {
            _ = BLEManager.instance
        })
    }
}

#Preview {
    BLEConnectionView()
}
