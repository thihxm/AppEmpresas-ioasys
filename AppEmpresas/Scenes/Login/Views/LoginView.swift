//
//  LoginView.swift
//  AppEmpresas
//
//  Created by Thiago Medeiros on 11/12/21.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isFilled: Bool = false
    
    func checkCompletion() -> Bool {
        !email.isEmpty && !password.isEmpty
    }
    
    var body: some View {
        VStack {
            Spacer()
            VStack(alignment: .leading, spacing: 32) {
                VStack(alignment: .leading, spacing: 0) {
                    Text("Boas vindas,")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text("Você está no Empresas.")
                        .font(.title3)
                        .fontWeight(.light)
                }
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 24)
                .background(
                    Image("LoginBG")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                )
                
                VStack(alignment: .leading, spacing: 32) {
                    Text("Digite seus dados para continuar")
                    
                    VStack(spacing: 16) {
                        FloatingLabelTextField(title: "Email", isSensitive: false, text: $email)
                        FloatingLabelTextField(title: "Senha", isSensitive: true, text: $password)
                    }
                    .padding(.bottom, 10)
                    
                    LoginButton(isComplete: checkCompletion())
                        .padding(.bottom, 24)
                }
                .frame(maxWidth: .infinity)
                .padding([.horizontal, .top], 24)
                .background(Color.white.edgesIgnoringSafeArea(.all))
            }
        }
        
    }
}

#if DEBUG
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
#endif
