//
//  BusinessInfoView.swift
//  AppEmpresas
//
//  Created by Thiago Medeiros on 13/12/21.
//

import SwiftUI

struct BusinessInfoView: View {
    @Environment(\.presentationMode) private var presentationMode
    
    let name: String
    let type: String
    let description: String
    let imageUrl: URL?
    
    func backButtonAction() {
        presentationMode.wrappedValue.dismiss()
    }

    var body: some View {
        VStack(spacing: 8) {
            ZStack(alignment: .leading) {
                
                VStack(spacing: 4) {
                    Text(name)
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    Text(type)
                        .font(.system(size: 16))
                }
                .frame(maxWidth: .infinity)
                .padding(.bottom, 24)
                .padding(.horizontal, 16)
                
                Button(action: backButtonAction) {
                    Image(systemName: "arrow.left")
                        .font(.system(size: 20, weight: .bold, design: .default))
                }
                .offset(y: -8)
            }
            .frame(maxWidth: .infinity, maxHeight: 140)
            .padding(.horizontal, 36)
            .background(
                    Image("NavigationHeader")
                        .resizable()
                        .edgesIgnoringSafeArea(.top)
            )
            .foregroundColor(.white)
            .padding(.bottom, -26)
            
            if let imageUrl = imageUrl {
                AsyncImage(url: imageUrl) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .cornerRadius(16, corners: [.bottomLeft, .bottomRight])
            } else {
                Image("McDonalds")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(16, corners: [.bottomLeft, .bottomRight])
            }
            
            ScrollView {
                Text(description)
                    .foregroundColor(.appNeutral)
                .padding(24)
            }
            
            Spacer()
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

extension BusinessInfoView {
    init(enterprise: Enterprise) {
        self.name = enterprise.enterprise_name
        self.type = enterprise.enterprise_type.enterprise_type_name
        self.description = enterprise.description
        self.imageUrl = enterprise.photoURL()
    }
}

#if DEBUG
struct BusinessInfoView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessInfoView(name: "Scaled Insights (incubated by IMCBA)", type: "Software", description: "Scaled Insights started with IMC's introduction to IBM's fledgling Watson Solutions. IMC became IBM Watson's first and Lead Partner for Canada and the Caribbean. We quickly learned the power of Watson AI and specifically the Personality Insights Engines that Watson contained. This began an exciting journey that has taken several years and millions of dollars as we've worked with both the IBM Team as well as our own group of PhDs, Data Scientists, Psychologists and other Industry Experts to design our own AI solution, which we call \"Behavioural AI\". \n\nBehavioural AI can reduce the language that all humans produce to communicate with each other down to personality profiles that include \"Big Five\" personality attributes as well as \"Thinking Styles\". These define how people see the world and determines how people receive and process information to make choices influence behaviour.", imageUrl: URL(string: "https://empresas.ioasys.com.br/uploads/enterprise/photo/43/240.jpeg"))
    }
}
#endif
