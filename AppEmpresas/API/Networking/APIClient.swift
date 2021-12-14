//
//  APIClient.swift
//  AppEmpresas
//
//  Created by Thiago Medeiros on 13/12/21.
//

import Foundation
import Combine

struct APIClient {
    var networker: Networker!
    
    init(networker: Networker = Networker()) {
        self.networker = networker
    }
    
    func dispatch<R: Request>(_ request: R) -> AnyPublisher<R.ReturnType, NetworkRequestError> {
        guard let urlRequest = request.urlRequest else {
            return Fail(outputType: R.ReturnType.self, failure: NetworkRequestError(status: .badRequest))
                .eraseToAnyPublisher()
        }
        typealias RequestPublisher = AnyPublisher<R.ReturnType, NetworkRequestError>
        let requestPublisher: RequestPublisher = networker.dispatch(request: urlRequest)
        return requestPublisher.eraseToAnyPublisher()
    }
}
