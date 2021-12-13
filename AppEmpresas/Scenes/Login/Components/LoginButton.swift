//
//  LoginButton.swift
//  AppEmpresas
//
//  Created by Thiago Medeiros on 11/12/21.
//

import SwiftUI

struct LoginButton: View {
    var isComplete: Bool = false
    var onClick: () -> Void = {}
    
    var body: some View {
        Button(action: onClick) {
            Text("Entrar")
                .kerning(2)
                .textCase(.uppercase)
                .foregroundColor(.white)
                .padding(.vertical, 17)
                .frame(maxWidth: .infinity)
                .background(isComplete ? Color.appNeutral2 : Color.appNeutral)
                .clipShape(Capsule())
        }
        .animation(.easeIn(duration: 0.1), value: isComplete)
    }
}

#if DEBUG
struct LoginButton_Previews: PreviewProvider {
    static var previews: some View {
        LoginButton()
    }
}
#endif
