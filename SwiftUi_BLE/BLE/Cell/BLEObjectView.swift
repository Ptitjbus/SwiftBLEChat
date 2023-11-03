//
//  BLEObjectView.swift
//  SwiftUi_BLE
//
//  Created by digital on 03/11/2023.
//

import SwiftUI

struct BLEObjectView: View {
    
    var model:BLEObjectViewModel = BLEObjectViewModel.defaultBLEObjectViewModel()
    
    var body: some View {
        HStack{
            Text(model.name).foregroundStyle(.blue)
        }
        
    }
}

#Preview {
    BLEObjectView()
}
