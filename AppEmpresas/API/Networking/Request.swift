//
//  Request.swift
//  AppEmpresas
//
//  Created by Thiago Medeiros on 13/12/21.
//

import Foundation
import Combine

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
    case patch = "PATCH"
}

public protocol Request {
    var endpoint: Endpoint { get }
    var method: HTTPMethod { get }
    var contentType: String { get }
    var body: [String: Any]? { get }
    var headers: [String: String]? { get }
    associatedtype ReturnType: Codable
}

extension Request {
    // Defaults
    var method: HTTPMethod { return .get }
    var contentType: String { return "application/json" }
    var queryParams: [String: String]? { return nil }
    var body: [String: Any]? { return nil }
    var headers: [String: String]? { return nil }
}

extension Request {
    private func requestBodyFrom(dict body: [String: Any]?) -> Data? {
        guard let body = body else { return nil }
        guard let JSONData = try? JSONSerialization.data(withJSONObject: body, options: []) else { return nil }
        return JSONData
    }
    
    var urlRequest: URLRequest? {
        guard let url = endpoint.url else {
            return nil
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.httpBody = requestBodyFrom(dict: body)
        request.allHTTPHeaderFields = headers
        return request
    }
}
