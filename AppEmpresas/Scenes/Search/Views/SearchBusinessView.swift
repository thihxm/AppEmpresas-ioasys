//
//  SearchBusinessView.swift
//  AppEmpresas
//
//  Created by Thiago Medeiros on 13/12/21.
//

import SwiftUI

struct SearchBusinessView: View {
    @ObservedObject var vm: SearchBusinessViewModel = SearchBusinessViewModel()
    
    @FocusState private var isSearching: Bool
    
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    func backButtonAction() {
        vm.clearData()
        isSearching = false
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            if vm.collapseTitle {
                ZStack(alignment: .leading) {
                    Button(action: backButtonAction) {
                        Image(systemName: "arrow.left")
                            .font(.system(size: 20, weight: .bold, design: .default))
                    }
                    .foregroundColor(.appSecondary)
                    .offset(x: 12)
                    
                    Text("Pesquise")
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.appPrimary)
                        .font(.system(size: 24, weight: .bold, design: .default))
                }
                .transition(.opacity)
            } else {
                Text("Pesquise por uma empresa")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.appPrimary)
                    .transition(.opacity)
            }
            
            SearchField(text: $vm.searchText)
                .focused($isSearching)

            if let enterprises = vm.enterprises, !vm.searchText.isEmpty {
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(enterprises, id: \.id) { enterprise in
                            Button(action: {
                                vm.selectEnterprise(enterprise)
                            }) {
                                EnterpriseCard(name: enterprise.enterprise_name, imageUrl: enterprise.photoURL())
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
                .padding()
            }
            
            if let selectedEnterprise = vm.selectedEnterprise {
                NavigationLink("", isActive: $vm.showDetailsView) {
                    BusinessInfoView(
                        businessInfo: selectedEnterprise.description,
                        imageUrl: selectedEnterprise.photoURL()
                    )
                }
            }
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .padding(24)
        .onChange(of: isSearching) { newValue in
            withAnimation {
                vm.collapseTitle = newValue
            }
        }
        .onChange(of: vm.debouncedText) { _ in
            vm.onSearch()
        }
    }
}

struct SearchBusinessView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBusinessView()
    }
}
