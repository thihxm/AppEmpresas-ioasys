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
    var headers: [String : String]?
    
    init(id: Int) {
        self.endpoint = Endpoint(path: "/enterprises/\(id)")
        
        guard let accessToken = UserDefaults.standard.string(forKey: "accessToken") else { return }
        guard let client = UserDefaults.standard.string(forKey: "client") else { return }
        guard let uid = UserDefaults.standard.string(forKey: "uid") else { return }
        
        self.headers = [
            "access-token": accessToken,
            "client": client,
            "uid": uid
        ]
    }
}
