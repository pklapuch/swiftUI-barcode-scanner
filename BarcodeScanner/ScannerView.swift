//
//  ScannerView.swift
//  BarcodeScanner
//
//  Created by Pawel Klapuch on 8/29/21.
//

import SwiftUI

struct ScannerView: UIViewControllerRepresentable {
    
    @Binding var scannedCode: String
    @Binding var alertItem: AlertItem?
        
    func makeUIViewController(context: Context) -> ScannerVC {
     
        return ScannerVC(delegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: ScannerVC, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        
        return Coordinator(scannerView: self)
    }
    
    final class Coordinator: NSObject, ScannerVCDelegate {
        
        private let scannerView: ScannerView
        
        init(scannerView: ScannerView) {
            
            self.scannerView = scannerView
        }
        
        func didFind(bardocde: String) {
            
            scannerView.scannedCode = bardocde
        }
        
        func didSurface(error: CameraError) {
            
            switch error {
            case .invalidDeviceInput: scannerView.alertItem = AlertContext.invalidDeviceInput
            case .invalidScannedValue: scannerView.alertItem = AlertContext.invalidBarcode
            }
        }
    }
}

struct ScannerView_Previews: PreviewProvider {
    static var previews: some View {
        ScannerView(scannedCode: .constant(""), alertItem: .constant(nil))
    }
}
