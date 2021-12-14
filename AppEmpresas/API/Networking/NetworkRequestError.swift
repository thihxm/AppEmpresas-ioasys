//
//  NetworkRequestError.swift
//  AppEmpresas
//
//  Created by Thiago Medeiros on 13/12/21.
//

import Foundation

public struct NetworkRequestError: LocalizedError {
    public struct ErrorRequestDTO: Codable {
        let errors: [String]
        let success: Bool
    }
    
    public enum Status: Equatable {
        case invalidRequest
        case badRequest
        case unauthorized
        case forbidden
        case notFound
        case error4xx(_ code: Int)
        case serverError
        case error5xx(_ code: Int)
        case decodingError
        case urlSessionFailed(_ error: URLError)
        case unknownError
        
    }
    
    public var status: Status
    public var jsonPayload: ErrorRequestDTO?
    
    public init(status: Status) {
        self.status = status
    }
    
    public var errorDescription: String? {
        return "\(self.status)"
    }
}
