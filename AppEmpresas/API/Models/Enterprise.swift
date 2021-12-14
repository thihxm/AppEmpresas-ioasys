//
//  Enterprise.swift
//  AppEmpresas
//
//  Created by Thiago Medeiros on 13/12/21.
//

import Foundation

struct Enterprise: Codable {
    struct EnterpriseType: Codable {
        let id: Int
        let enterprise_type_name: String
    }
    
    let id: Int
    let email_enterprise: String?
    let facebook: String?
    let twitter: String?
    let linkedin: String?
    let phone: String?
    let own_enterprise: Bool
    let enterprise_name: String
    let photo: String
    let description: String
    let city: String
    let country: String
    let value: Int
    let share_price: Double
    let enterprise_type: EnterpriseType
}
