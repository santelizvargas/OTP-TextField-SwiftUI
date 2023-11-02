//
//  OTPCoordinator.swift
//  OTP View
//
//  Created by Steven Santeliz on 2/11/23.
//

import UIKit

// MARK: - OTP Coordinator

final class OTPCoordinator: NSObject {
    
    private let parent: OTPTextField
    
    init(_ parent: OTPTextField) {
        self.parent = parent
    }
}

// MARK: - OTP Coordinator UITextFieldDelegate

extension OTPCoordinator: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        DispatchQueue.main.async { [unowned self] in
            parent.text = textField.text ?? ""
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        parent.isFocused = false
    }
}
