//
//  Authenticate.swift
//  AppEmpresas
//
//  Created by Thiago Medeiros on 13/12/21.
//

import Foundation

struct Authenticate: Request {
    typealias ReturnType = User
    var endpoint: Endpoint = Endpoint(path: "/users/auth/sign_in")
}
