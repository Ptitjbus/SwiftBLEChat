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
            .toolbar {
                Button {
                    model.isScanning ? model.stopScan() : model.startScan()
                } label: {
                    if model.isScanning{
                        Label("Stop", systemImage: "stop.circle")
                    } else {
                        Label("Scan", systemImage: "dot.radiowaves.left.and.right")
                    }
                }
                .tint(model.isScanning ? .red : .accentColor)
            }
            .padding()
        }.onAppear(perform: {
            _ = BLEManager.instance
        })
    }
}

#Preview {
    BLEConnectionView()
}
