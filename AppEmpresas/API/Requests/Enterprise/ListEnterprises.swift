//
//  ListEnterprises.swift
//  AppEmpresas
//
//  Created by Thiago Medeiros on 13/12/21.
//

import Foundation
struct ListEnterprisesDTO: Codable {
    let enterprises: [Enterprise]
}

struct ListEnterprises: Request {
    typealias ReturnType = ListEnterprisesDTO
    var endpoint: Endpoint
    
    init(enterprise_type: Int?, name: String?) {
        var queryItems: [URLQueryItem] = []
        
        if let enterprise_type = enterprise_type {
            queryItems.append(URLQueryItem(name: "enterprise_types", value: "\(enterprise_type)"))
        }
        if let name = name {
            queryItems.append(URLQueryItem(name: "name", value: name))
        }
        
        self.endpoint = Endpoint(path: "/enterprises", queryItems: queryItems)
    }
}
