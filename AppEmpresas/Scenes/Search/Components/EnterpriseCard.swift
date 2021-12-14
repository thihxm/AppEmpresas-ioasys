//
//  EnterpriseCard.swift
//  AppEmpresas
//
//  Created by Thiago Medeiros on 14/12/21.
//

import SwiftUI

struct EnterpriseCard: View {
    let name: String
    let imageUrl: URL?
    
    var body: some View {
            ZStack(alignment: .bottom) {
                Image("EnterpriseBG")
                    .clipped()
                
                if let imageUrl = imageUrl {
                    AsyncImage(url: imageUrl) { image in
                        image
                            .resizable()
                            .scaledToFill()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 88, height: 128)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .offset(y: -16)
                    .shadow(color: .black.opacity(0.2), radius: 8, y: 4)
                } else {
                    Image(systemName: "wifi.exclamationmark")
                        .resizable()
                        .scaledToFill()
                        .shadow(color: .black.opacity(0.2), radius: 8, y: 4)
                }
                
                Text(name)
                    .foregroundColor(.appNeutral)
                    .font(.system(size: 14))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 8)
                    .background(Color.white)
                    .frame(width: 152)
                    .clipShape(RoundedCornersShape(radius: 16, corners: [.bottomLeft, .bottomRight]))
                    .shadow(color: .black.opacity(0.2), radius: 10, y: 4)
            }
            .frame(width: 152)
    }
}

struct EnterpriseCard_Previews: PreviewProvider {
    static var previews: some View {
        EnterpriseCard(name: "McDonald's", imageUrl: URL(string: "https://empresas.ioasys.com.br/uploads/enterprise/photo/1/240.jpeg"))
    }
}
