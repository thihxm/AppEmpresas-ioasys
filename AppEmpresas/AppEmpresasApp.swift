//
//  AppEmpresasApp.swift
//  AppEmpresas
//
//  Created by Thiago Medeiros on 11/12/21.
//

import SwiftUI

@main
struct AppEmpresasApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                LoginView()
                    .navigationTitle("Login")
                    .navigationBarHidden(true)
            }
        }
    }
}
