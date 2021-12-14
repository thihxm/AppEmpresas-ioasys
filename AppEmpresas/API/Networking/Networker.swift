//
//  Networker.swift
//  AppEmpresas
//
//  Created by Thiago Medeiros on 13/12/21.
//

import Foundation
import Combine


struct Networker {
    let urlSession: URLSession!
    public init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    func dispatch<ReturnType: Codable>(request: URLRequest) -> AnyPublisher<ReturnType, NetworkRequestError> {
        return urlSession
            .dataTaskPublisher(for: request)
            .tryMap({ data, response in
                if let response = response as? HTTPURLResponse,
                   !(200...299).contains(response.statusCode) {
                    var error = httpError(response.statusCode)
                    if let json = try? JSONDecoder().decode(NetworkRequestError.ErrorRequestDTO.self, from: data) {
                        error.jsonPayload = json
                    }
                    throw error
                }
                
                return data
            })
            .decode(type: ReturnType.self, decoder: JSONDecoder())
            .mapError { error in
                handleError(error)
            }
            .eraseToAnyPublisher()
    }
}

extension Networker {
    private func httpError(_ statusCode: Int) -> NetworkRequestError {
        switch statusCode {
        case 400: return NetworkRequestError(status: .badRequest)
        case 401: return NetworkRequestError(status: .unauthorized)
        case 403: return NetworkRequestError(status: .forbidden)
        case 404: return NetworkRequestError(status: .notFound)
        case 402, 405...499: return NetworkRequestError(status: .error4xx(statusCode))
        case 500: return NetworkRequestError(status: .serverError)
        case 501...599: return NetworkRequestError(status: .error5xx(statusCode))
        default: return NetworkRequestError(status: .unknownError)
        }
    }
    
    private func handleError(_ error: Error) -> NetworkRequestError {
        switch error {
        case is Swift.DecodingError:
            return NetworkRequestError(status: .decodingError)
        case let urlError as URLError:
            return NetworkRequestError(status: .urlSessionFailed(urlError))
        case let error as NetworkRequestError:
            return error
        default:
            return NetworkRequestError(status: .unknownError)
        }
    }
}
