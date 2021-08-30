//
//  Alert.swift
//  BarcodeScanner
//
//  Created by Pawel Klapuch on 8/29/21.
//

import SwiftUI

struct AlertItem: Identifiable {
    
    let id = UUID()
    
    let title: String
    let message: String
    let dismissButton: Alert.Button
}

struct AlertContext {
    
    static let invalidDeviceInput = AlertItem(title: "Invalid Device Input",
                                              message: "Check your camera status bro!",
                                              dismissButton: .default(Text("OK")))
    
    static let invalidBarcode = AlertItem(title: "Invalid Barcode",
                                          message: "Check your barcode bro!",
                                          dismissButton: .default(Text("OK")))
}
