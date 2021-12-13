//
//  FloatingLabelField.swift
//  AppEmpresas
//
//  Created by Thiago Medeiros on 11/12/21.
//

import SwiftUI

struct FloatingLabelField: View {
    let title: String
    let isSensitive: Bool
    var errorMessage: String = ""
    @Binding var text: String
    
    @FocusState private var isFocused: Bool
    @State var showPassword: Bool = false
    
    private func boderColor() -> Color {
        if !errorMessage.isEmpty {
            return Color.appError
        }
        if isFocused {
            return Color.appSecondary
        }
        return Color.appInputBorder
    }
    
    private func textColor() -> Color {
        if errorMessage.isEmpty {
            return text.isEmpty ? Color(.placeholderText) : .appNeutral2
        }
        return Color.appError
    }
    
    private func showPasswordAction() {
        showPassword.toggle()
    }
    
    
    struct HiddenField: View {
        let isHidden: Bool
        @Binding var text: String
        
        var body: some View {
            if isHidden {
                SecureField("", text: self.$text)
            } else {
                TextField("", text: self.$text)
            }
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            ZStack(alignment: .leading) {
                Text(title)
                    .foregroundColor(textColor())
                    .offset(x: text.isEmpty ? 0 : -8, y: text.isEmpty ? 0 : -41)
                    .scaleEffect(text.isEmpty ? 1 : 0.8, anchor: .leading)
                
                HStack {
                    if isSensitive {
                        HiddenField(isHidden: !showPassword, text: $text)
                            .foregroundColor(textColor())
                            .focused($isFocused)
                    } else {
                        TextField("", text: $text)
                            .foregroundColor(textColor())
                            .focused($isFocused)
                    }
                    
                    if isSensitive {
                        Button(action: showPasswordAction) {
                            Image(systemName: showPassword ? "eye.slash" : "eye")
                                .foregroundColor(.appNeutral)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(boderColor(), lineWidth: 1)
            )
            .padding(.top, 16)
            .animation(.spring(response: 0.2, dampingFraction: 0.5), value: !text.isEmpty)
            
            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .font(.system(size: 12))
                    .foregroundColor(.appError)
                    .offset(x: 9)
            }
        }
    }
}

#if DEBUG
fileprivate struct FloatingLabelTextFieldPreview: View {
    let isSensitive: Bool
    var errorMessage: String = ""
    @State private var text: String = ""
    
    var body: some View {
        FloatingLabelField(title: "Email", isSensitive: isSensitive, errorMessage: errorMessage, text: $text)
    }
}

struct FloatingLabelTextField_Previews: PreviewProvider {   
    static var previews: some View {
        Group {
            FloatingLabelTextFieldPreview(isSensitive: false)
                .previewLayout(.sizeThatFits)
            FloatingLabelTextFieldPreview(isSensitive: true)
                .previewLayout(.sizeThatFits)
            FloatingLabelTextFieldPreview(isSensitive: false, errorMessage: "Endereço de email inválido")
                .previewLayout(.sizeThatFits)
        }
    }
}
#endif
