//
//  HomePageView.swift
//  LostAndfound
//
//  Created by Deka Primatio on 21/07/23.
//

import SwiftUI

struct HomePageView: View {
    
    @AppStorage ("isOnboardingViewed") var isOnboardingViewed: Bool = false
    
    @EnvironmentObject var writevm: WriteViewModel
    @EnvironmentObject var readvm: ReadViewModel
    
    //MARK: - BODY
    var body: some View {
        NavigationView {
            VStack {
                Image("SectionAtas")
                    .resizable()
                    .scaledToFit()
                
                HStack {
                    Image("MenuKiri")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200)
                    
                    if isOnboardingViewed {
                        NavigationLink(destination: LandingPageView()) {
                            VStack {
                                Image("LostAndFoundIcon")
                                    .padding(.top, 12)
                                    .padding(.bottom, 5)

                                Text("Lost & Found")
                                    .font(.system(size: 11))
                            }
                        }
                        .foregroundColor(Color.black)
                    } else {
                        NavigationLink(destination: FirstFormView()) {
                            VStack {
                                Image("LostAndFoundIcon")
                                    .padding(.top, 12)
                                    .padding(.bottom, 5)

                                Text("Lost & Found")
                                    .font(.system(size: 11))
                            }
                        }
                        .foregroundColor(Color.black)
                    }
                    
                    Image("MenuKanan")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 130)
                }
                
                Image("SectionBawah")
                    .resizable()
                    .scaledToFit()
            }
        }
    }//: - BODY
}

//MARK: - PREVIEW
struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
