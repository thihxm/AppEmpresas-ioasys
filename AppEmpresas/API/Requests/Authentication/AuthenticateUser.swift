//
//  AuthenticateUser.swift
//  AppEmpresas
//
//  Created by Thiago Medeiros on 13/12/21.
//

import Foundation

struct AuthenticateUserRequestDTO: Codable {
    let email: String
    let password: String
}

struct AuthenticateUserDTO: Codable {
    let email: String
    let password: String
}

struct AuthenticateUser: Request {
    typealias ReturnType = User
    var endpoint: Endpoint = Endpoint(path: "/users/auth/sign_in")
    var method: HTTPMethod = .post
    var body: [String : Any]?
    
    init(body: [String : Any]) {
        self.body = body
    }
}
