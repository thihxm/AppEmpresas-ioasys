//
//  Endpoint.swift
//  AppEmpresas
//
//  Created by Thiago Medeiros on 13/12/21.
//

import Foundation

public struct Endpoint {
    var path: String
    var queryItems: [URLQueryItem] = []
}

extension Endpoint {
    var url: URL? {
        let devHost = "empresas.ioasys.com.br"
        let apiVersion = "v1"
        var components = URLComponents()
        components.scheme = "https"
        components.host = "\(devHost)/api/\(apiVersion)"
        components.path = path
        components.queryItems = queryItems
        
        guard let url = components.url else { return nil }
        
        return url
    }
}
