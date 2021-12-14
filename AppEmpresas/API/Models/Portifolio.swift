//
//  Portifolio.swift
//  AppEmpresas
//
//  Created by Thiago Medeiros on 13/12/21.
//

import Foundation

struct Portfolio: Codable {
    let enterprises_number: Int
    let enterprises: [Enterprise]
}
