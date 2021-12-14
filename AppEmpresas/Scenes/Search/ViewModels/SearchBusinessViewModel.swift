//
//  SearchBusinessViewModel.swift
//  AppEmpresas
//
//  Created by Thiago Medeiros on 14/12/21.
//

import Foundation
import Combine

class SearchBusinessViewModel: ObservableObject {
    @Published var enterprises: [Enterprise]?
    
    @Published var debouncedText: String = ""
    @Published var searchText: String = ""
    
    @Published var collapseTitle: Bool = false
    
    private var enterprisesService: EnterprisesServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    
    @Published var selectedEnterprise: Enterprise? = nil
    @Published var showDetailsView: Bool = false
    
    init(enterprisesService: EnterprisesServiceProtocol = EnterprisesService()) {
        self.enterprisesService = enterprisesService
        
        $searchText
            .debounce(for: .seconds(1), scheduler: DispatchQueue.main)
            .sink(receiveValue: { value in
                self.debouncedText = value
            })
            .store(in: &cancellables)
    }
    
    func clearData() {
        self.searchText = ""
        self.debouncedText = ""
    }
    
    func selectEnterprise(_ enterprise: Enterprise) {
        selectedEnterprise = enterprise
        showDetailsView = true
    }
    
    func onSearch() {
        listEnterprises()
    }
    
    private func listEnterprises() {
        self.enterprisesService.listEnterprises(enterprise_type: nil, name: searchText)
            .receive(on: DispatchQueue.main)
            .sink{ completion in
                switch completion {
                case .failure(let error):
                    print(error)
                    if let jsonPayload = error.jsonPayload {
                        print(jsonPayload)
                    }
                case .finished: break
                }
            } receiveValue: { [weak self] response in
                self?.enterprises = response.enterprises
                print(response.enterprises)
            }
            .store(in: &cancellables)
    }
}
