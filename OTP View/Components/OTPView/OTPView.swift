//
//  OTPView.swift
//  OTP View
//
//  Created by Steven Santeliz on 2/11/23.
//

import SwiftUI

// MARK: - OTP View

struct OTPView: View {
    
    // MARK: - Properties
    
    @State private var textCode: String = ""
    @State private var isFocused: Bool = false
    
    private let maxItems: Int = 4
    
    // MARK: - Main OTP View
    
    var body: some View {
        
        VStack {
            HStack {
                ForEach(0..<maxItems, id: \.self) { index in
                    OTPItem(index)
                }
            }
            .background (
                OTPTextField(text: $textCode.limit(maxItems),
                             isFocused: $isFocused)
                .opacity(0.001)
            )
            .onTapGesture {
                isFocused = true
            }
            
            Button { } label: {
                Text("Validate")
                    .foregroundColor(Color.white)
                    .frame(width: 200, height: 50)
                    .background(textCode.count >= maxItems ? Color.blue : Color.gray)
                    .cornerRadius(10)
                    .padding()
                
            }
        }
    }
}

// MARK: - OTP View Items

extension OTPView {
    
    private func OTPItem(_ index: Int) -> some View {
        
        if index < textCode.count {
            let startIndex = textCode.startIndex
            let number = textCode.index(startIndex, offsetBy: index)
            let numberString = String(textCode[number])
            
            return Item(numberString)
        }
        
        return Item(" ")
    }
    
    private func Item(_ number: String) -> some View {
        VStack(spacing: 1) {
            
            Text(number)
                .font(.system(size: 20).bold())
            
            RoundedRectangle(cornerRadius: 5)
                .foregroundColor(.black)
                .frame(width: 30, height: 3)
        }
        .padding(.horizontal, 5)
    }
    
}

#Preview {
    OTPView()
}
