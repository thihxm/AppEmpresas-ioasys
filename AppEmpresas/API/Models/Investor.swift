//
//  Investor.swift
//  AppEmpresas
//
//  Created by Thiago Medeiros on 13/12/21.
//

import Foundation

struct Investor: Codable {
    let id: Int
    let investor_name: String
    let email: String
    let city: String
    let country: String
    let balance: Double
    let photo: String?
    let portfolio: Portfolio
    let portfolio_value: Double
    let first_access: Bool
    let super_angel: Bool
}
