//
//  EnterprisesService.swift
//  AppEmpresas
//
//  Created by Thiago Medeiros on 14/12/21.
//

import Foundation
import Combine

protocol EnterprisesServiceProtocol {
    func findEnterpriseBy(id: Int) -> AnyPublisher<FindEnterprise.ReturnType, NetworkRequestError>
    func listEnterprises(enterprise_type: Int?, name: String?) -> AnyPublisher<ListEnterprises.ReturnType, NetworkRequestError>
}

class EnterprisesService: EnterprisesServiceProtocol {
    let apiClient: APIClient
    
    init(apiClient: APIClient = APIClient()) {
        self.apiClient = apiClient
    }
    
    func findEnterpriseBy(id: Int) -> AnyPublisher<FindEnterprise.ReturnType, NetworkRequestError> {
        return apiClient.dispatch(FindEnterprise(id: id))
    }
    
    func listEnterprises(enterprise_type: Int?, name: String?) -> AnyPublisher<ListEnterprises.ReturnType, NetworkRequestError> {
        return apiClient.dispatch(ListEnterprises(enterprise_type: enterprise_type, name: name))
    }
}
