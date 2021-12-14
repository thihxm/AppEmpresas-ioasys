//
//  LoginViewModel.swift
//  AppEmpresas
//
//  Created by Thiago Medeiros on 13/12/21.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    @Published var user: User?
    
    @Published var email: String = ""
    @Published var password: String = ""
    
    @Published var isLoading: Bool = false
    @Published var isAuthenticated: Bool = false
    
    private var authService: AuthenticationServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(authService: AuthenticationServiceProtocol = AuthenticationService()) {
        self.authService = authService
    }
    
    func checkCompletion() -> Bool {
        !email.isEmpty && isValidEmail() && !password.isEmpty
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func authenticateUser() {
        self.authService.authenticateUser(email: email, password: password)
            .receive(on: DispatchQueue.main)
            .sink{ [weak self] completion in
                switch completion {
                case .failure(let error):
                    self?.isLoading = false
                    print(error)
                    if let jsonPayload = error.jsonPayload {
                        print(jsonPayload)
                    }
                case .finished: break
                }
            } receiveValue: { [weak self] user in
                self?.user = user
                self?.isAuthenticated = true
                self?.isLoading = false
            }
            .store(in: &cancellables)
    }
}
