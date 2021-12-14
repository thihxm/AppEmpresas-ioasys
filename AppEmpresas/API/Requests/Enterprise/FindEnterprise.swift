//
//  FindEnterprise.swift
//  AppEmpresas
//
//  Created by Thiago Medeiros on 13/12/21.
//

import Foundation

struct FindEnterpriseDTO: Codable {
    let enterprise: Enterprise
    let success: Bool
}

struct FindEnterprise: Request {
    typealias ReturnType = FindEnterpriseDTO
    var endpoint: Endpoint
    
    init(id: Int) {
        self.endpoint = Endpoint(path: "/enterprises/\(id)")
    }
}
