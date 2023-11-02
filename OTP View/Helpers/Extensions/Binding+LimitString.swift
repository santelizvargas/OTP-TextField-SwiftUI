//
//  Binding+LimitString.swift
//  OTP View
//
//  Created by Steven Santeliz on 2/11/23.
//

import SwiftUI

// MARK: - Binding + Limit String

extension Binding where Value == String {
    
    func limit(_ size: Int) -> Self {
        
        if self.wrappedValue.count > size {
            DispatchQueue.main.async {
                self.wrappedValue = String(self.wrappedValue.prefix(size))
            }
        }
        
        return self
    }
}

