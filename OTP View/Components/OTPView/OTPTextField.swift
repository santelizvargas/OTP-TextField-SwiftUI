//
//  OTPTextField.swift
//  OTP View
//
//  Created by Steven Santeliz on 2/11/23.
//

import SwiftUI

// MARK: - OTP Text Field from UIKit

struct OTPTextField: UIViewRepresentable {
    
    typealias TextField = CustomTextField
    
    @Binding var text: String
    @Binding var isFocused: Bool
    
    func makeUIView(context: Context) -> TextField {
        
        let textField = TextField()
        textField.delegate = context.coordinator
        textField.keyboardType = .numberPad
        textField.addDoneButton()
        
        return textField
    }
    
    func updateUIView(_ uiView: TextField, context: Context) {
        
        uiView.text = text
        
        if isFocused {
            uiView.becomeFirstResponder()
        } else {
            uiView.resignFirstResponder()
        }
    }
    
    func makeCoordinator() -> OTPCoordinator {
        OTPCoordinator(self)
    }
}
