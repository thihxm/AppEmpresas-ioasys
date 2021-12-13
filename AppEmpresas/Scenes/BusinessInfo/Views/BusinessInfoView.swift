//
//  BusinessInfoView.swift
//  AppEmpresas
//
//  Created by Thiago Medeiros on 13/12/21.
//

import SwiftUI

struct BusinessInfoView: View {
    let businessInfo: String

    var body: some View {
        VStack(spacing: 8) {
            Image("McDonalds")
                .resizable()
                .scaledToFit()
                .cornerRadius(16, corners: [.bottomLeft, .bottomRight])
            
            Text(businessInfo)
                .foregroundColor(.appNeutral)
                .padding(24)
            
            Spacer()
        }
    }
}

#if DEBUG
struct BusinessInfoView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessInfoView(businessInfo: "McDonald's Corporation é a maior cadeia mundial de restaurantes de fast food de hambúrguer, servindo cerca de 68 milhões de clientes por dia em 119 países através de 37 mil pontos de venda. Com sede nos Estados Unidos, a empresa começou em 1940 como uma churrascaria operada por Richard e Maurice McDonald. Em 1948, eles reorganizaram seus negócios como uma hamburgueria que usava os princípios de uma linha de produção. O empresário Ray Kroc ingressou na empresa como franquiado em 1955.")
    }
}
#endif
