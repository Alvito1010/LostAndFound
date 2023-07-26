//
//  LandingPageView.swift
//  LostAndfound
//
//  Created by Alvito . on 19/07/23.
//

import SwiftUI

struct LandingPageView: View {
    @EnvironmentObject var writevm: WriteViewModel
    @EnvironmentObject var readvm: ReadViewModel
    @State var text1 = "ggggggg"
    @State private var selectedTab = 0
    init() {
        // Use this to modify the appearance of the NavigationBar
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = .white
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    var body: some View {
        TabView(selection: $selectedTab) {
            //            NavigationView {
            LaporanView().environmentObject(readvm).environmentObject(writevm)
            
            
            //            }
                .tabItem {
                    createTabItem(imageName: "exclamationmark.bubble.fill", title: "Laporan", index: 0)
                }
                .tag(0)
            
            PencarianView()
            
                .tabItem {
                    createTabItem(imageName: "magnifyingglass", title: "Pencarian", index: 1)
                }
                .tag(1)
            
            HasilView()
            
                .tabItem {
                    createTabItem(imageName: "archivebox.fill", title: "Hasil", index: 2)
                }
                .tag(2)
            
            SelesaiView()
            
                .tabItem {
                    createTabItem(imageName: "checkmark.bubble.fill", title: "Selesai", index: 3)
                }
                .tag(3)
            
            BatalView()
            
                .tabItem {
                    createTabItem(imageName: "x.circle.fill", title: "Batal", index: 4)
                }
                .tag(4)
            
        }.tint(Color("MRTBlue")).onAppear(){
            readvm.observeStatus(laporanId: 0)
        }
        
    }
    
    private func createTabItem(imageName: String, title: String, index: Int) -> some View {
        VStack {
            ZStack {
                Image(systemName: imageName)
                    .foregroundColor(Color("MRTBlue")) // Change icon color based on selection
                //                if selectedTab == index { // Show the dot only for the active tab
                //                    Circle()
                //                        .foregroundColor(Color("MRTBlue")) // Customize the dot color as needed
                //                        .frame(width: 8, height: 8)
                //                        .offset(y: -10)
                //                }
            }
            Text(title)
        }
    }
    
    
    private var tabNavigationTitle: String {
        switch selectedTab {
        case 0: return "Laporan"
        case 1: return "Pencarian"
        case 2: return "Hasil"
        case 3: return "Selesai"
        case 4: return "Batal"
        default: return "Unknown"
        }
    }
}

struct LandingPageView_Previews: PreviewProvider {
    static var previews: some View {
        LandingPageView()
    }
}
