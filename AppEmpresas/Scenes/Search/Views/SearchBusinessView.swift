//
//  SearchBusinessView.swift
//  AppEmpresas
//
//  Created by Thiago Medeiros on 13/12/21.
//

import SwiftUI

struct SearchBusinessView: View {
    @State var searchText: String = ""
    @State private var collapseTitle: Bool = false
    
    @FocusState private var isSearching: Bool
    
    func backButtonAction() {
        searchText = ""
        isSearching = false
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 32) {
                if collapseTitle {
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
                
                SearchField(text: $searchText)
                    .focused($isSearching)
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding(24)
            .navigationBarTitle("Pesquise", displayMode: .inline)
            .navigationBarHidden(true)
            .onChange(of: isSearching) { newValue in
                withAnimation {
                    collapseTitle = newValue
                }
            }
        }
    }
}

struct SearchBusinessView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBusinessView()
    }
}
