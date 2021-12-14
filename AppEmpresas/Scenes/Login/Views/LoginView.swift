//
//  LoginView.swift
//  AppEmpresas
//
//  Created by Thiago Medeiros on 11/12/21.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var vm: LoginViewModel = LoginViewModel()
    
    func invalidEmailMessage() -> String {
        if !vm.email.isEmpty {
            return vm.isValidEmail() ? "" : "Endereço de email inválido"
        }
        return ""
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
                        FloatingLabelField(title: "Email", isSensitive: false, errorMessage: invalidEmailMessage(), text: $vm.email)
                        FloatingLabelField(title: "Senha", isSensitive: true, text: $vm.password)
                    }
                    .padding(.bottom, 10)
                    
                    LoginButton(isComplete: vm.checkCompletion()) {
                        vm.authenticateUser()
                    }
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
