//
//  SearchField.swift
//  AppEmpresas
//
//  Created by Thiago Medeiros on 13/12/21.
//

import SwiftUI

struct SearchField: View {
    @Binding var text: String
    
    @State private var showIcon: Bool = true
    @FocusState private var isFocused: Bool
    
    private func boderColor() -> Color {
        if isFocused {
            return Color.appSecondary
        }
        return Color.appInputBorder
    }
    
    var body: some View {
        HStack(spacing: 8) {
            if showIcon {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.appInputBorder)
                    .transition(.opacity)
            }
            
            TextField("Buscar...", text: $text)
                .foregroundColor(.appNeutral2)
                .focused($isFocused)
                .onChange(of: text) { newValue in
                    withAnimation {
                        showIcon = newValue.isEmpty
                    }
                }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(boderColor(), lineWidth: 1)
        )
    }
}

#if DEBUG
fileprivate struct SearchFieldPreview: View {
    @State private var text: String = ""
    
    var body: some View {
        SearchField(text: $text)
    }
}

struct SearchField_Previews: PreviewProvider {
    static var previews: some View {
        SearchFieldPreview()
    }
}
#endif
