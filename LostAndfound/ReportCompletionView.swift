//
//  ReportCompletionView.swift
//  LostAndfound
//
//  Created by Deka Primatio on 22/07/23.
//

import SwiftUI

struct ReportCompletionView: View {
    //MARK: - PROPERTIES
    @State private var isPresentingLandingPage = false
    @AppStorage("isOnboardingViewed") var isOnboardingViewed: Bool = false

    
    //MARK: - BODY
    var body: some View {
        //Main Wrapper for Icon, Text, & Button (VStack)
        ZStack {
            Color(.white).frame(width: .infinity, height: .infinity)
            VStack {
                
                Image("MRTIcon")
                    .padding(.bottom, 47)
                
                Text("Laporan Berhasil Diajukan!")
                    .formTextStyle()
                    .fontWeight(.semibold)
                    .padding(.bottom, 1)
                
                Text("Nomor Laporan : LB140720230408")
                    .descriptionStyle()
                    .foregroundColor(Color("MRTBlue"))
                    .padding(.bottom, 17)
                
                Text("Hai Sobat MRT J, laporan barang hilang telah berhasil diajukan. Pantau status pelaporan di menu utama Lost and Found MRT Jakarta.")
                    .descriptionStyle()
                    .padding(.horizontal, 24)
                
                Button {
                    isPresentingLandingPage = true
                    isOnboardingViewed = true
                } label: {
                    Text("Status Laporan")
                        .activeButtonStyle()
                }
                .padding(.top, 53)
                .fullScreenCover(isPresented: $isPresentingLandingPage, content: {
                    NavigationView {
                        LandingPageView()
                            .navigationBarTitle("Landing Page", displayMode: .inline)
                            .navigationBarHidden(true)
                    }
                })// - Full Screen Cover
            }
            //: - Main Wrapper for Icon, Text, & Button (VStack)
            .padding()
        }
    }//: - BODY
}

//MARK: - PREVIEW
struct ReportCompletionView_Previews: PreviewProvider {
    static var previews: some View {
        ReportCompletionView()
    }
}
