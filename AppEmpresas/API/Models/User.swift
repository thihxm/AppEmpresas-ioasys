//
//  User.swift
//  AppEmpresas
//
//  Created by Thiago Medeiros on 13/12/21.
//

import Foundation

struct User: Codable {
    let investor: Investor
    let enterprise: String?
    let success: Bool
}
