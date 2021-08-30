//
//  ContentView.swift
//  BarcodeScanner
//
//  Created by Pawel Klapuch on 8/29/21.
//

import SwiftUI

struct BarcodeScannerView: View {
    
    @StateObject private var viewModel = BarcodeScannerViewModel()
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                ScannerView(scannedCode: $viewModel.scannedCode, alertItem: $viewModel.alertItem)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                
                Spacer()
                    .frame(height: 50)
                
                Label("Scanned Barcode:", systemImage: "barcode.viewfinder")
                    .font(.title)
                
                Text(viewModel.statusText)
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(viewModel.statusTextColor)
                    .padding()
                        
            }
            .navigationTitle("Barcode Scanner")
            .alert(item: $viewModel.alertItem) { item in
                Alert(title: Text(item.title),
                      message: Text(item.message),
                      dismissButton: item.dismissButton)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BarcodeScannerView()
    }
}
