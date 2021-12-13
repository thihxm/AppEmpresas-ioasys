//
//  RoundedCornersModifier.swift
//  AppEmpresas
//
//  Created by Thiago Medeiros on 13/12/21.
//

import Foundation
import SwiftUI

struct RoundedCornersShape: Shape {
    let radius: CGFloat
    let corners: UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct RoundedCornersModifier: ViewModifier {
    let radius: CGFloat
    let corners: UIRectCorner
    
    func body(content: Content) -> some View {
        content
            .clipShape(RoundedCornersShape(radius: radius, corners: corners))
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        self.modifier(RoundedCornersModifier(radius: radius, corners: corners))
    }
}
