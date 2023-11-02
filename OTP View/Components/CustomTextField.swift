//
//  CustomTextField.swift
//  OTP View
//
//  Created by Brandon Santeliz on 11/1/23.
//

import UIKit

// MARK: - Custom Text Field

final class CustomTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @objc private func doneAction() {
        resignFirstResponder()
    }
    
    func addDoneButton() {
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done",
                                         style: .done,
                                         target: self,
                                         action: #selector(doneAction))
        toolBar.items = [doneButton]
        
        inputAccessoryView = toolBar
    }
}
