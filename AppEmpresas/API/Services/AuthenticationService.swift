//
//  AuthenticationService.swift
//  AppEmpresas
//
//  Created by Thiago Medeiros on 13/12/21.
//

import Foundation
import Combine

protocol AuthenticationServiceProtocol {
    func authenticateUser(email: String, password: String) -> AnyPublisher<AuthenticateUser.ReturnType, NetworkRequestError>
}

class AuthenticationService: AuthenticationServiceProtocol {
    let apiClient: APIClient
    
    init(apiClient: APIClient = APIClient()) {
        self.apiClient = apiClient
    }
    
    func authenticateUser(email: String, password: String) -> AnyPublisher<AuthenticateUser.ReturnType, NetworkRequestError> {
        let userInfo: AuthenticateUserRequestDTO = AuthenticateUserRequestDTO(email: email, password: password)
        return apiClient.dispatch(AuthenticateUser(body: userInfo.asDictionary))
    }
}
