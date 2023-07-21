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
            NavigationView {
                LaporanView().environmentObject(readvm).environmentObject(writevm)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            HStack {
                                Text(tabNavigationTitle) // Your navigation title
                                    .font(.largeTitle).fontWeight(.bold).padding()
                                Spacer() // Flexible spacer to push the button to the trailing side
                            }
                        }
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: {
                                // Your button action here
                                print(readvm.status1Tanggal)
                                print(readvm.status1Waktu)
                            }) {
                                Image(systemName: "plus.circle.fill")
                                    .font(.system(size: 20))
                            }
                            .padding(.trailing, 16)
                        }
                    }
            }
            .tabItem {
                createTabItem(imageName: "exclamationmark.bubble.fill", title: "Laporan", index: 0)
            }
            .tag(0)
            
            NavigationView {
                PencarianView()
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            HStack {
                                Text(tabNavigationTitle) // Your navigation title
                                    .font(.largeTitle).fontWeight(.bold).padding()
                                Spacer() // Flexible spacer to push the button to the trailing side
                            }
                        }
                        
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: {
                                // Your button action here
                                print("hhhhh")
                            }) {
                                Image(systemName: "plus.circle.fill")
                                    .font(.system(size: 20))
                            }
                            .padding(.trailing, 16)
                        }
                    }
            }
            .tabItem {
                createTabItem(imageName: "magnifyingglass", title: "Pencarian", index: 1)
            }
            .tag(1)
            
            NavigationView {
                HasilView()
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            HStack {
                                Text(tabNavigationTitle) // Your navigation title
                                    .font(.largeTitle).fontWeight(.bold).padding()
                                Spacer() // Flexible spacer to push the button to the trailing side
                            }
                        }
                        
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: {
                                // Your button action here
                                print("hhhhh")
                            }) {
                                Image(systemName: "plus.circle.fill")
                                    .font(.system(size: 20))
                            }
                            .padding(.trailing, 16)
                        }
                    }
            }
            .tabItem {
                createTabItem(imageName: "archivebox.fill", title: "Hasil", index: 2)
            }
            .tag(2)
            
            NavigationView {
                SelesaiView()
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            HStack {
                                Text(tabNavigationTitle) // Your navigation title
                                    .font(.largeTitle).fontWeight(.bold).padding()
                                Spacer() // Flexible spacer to push the button to the trailing side
                            }
                        }
                        
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: {
                                // Your button action here
                                print("hhhhh")
                            }) {
                                Image(systemName: "plus.circle.fill")
                                    .font(.system(size: 20))
                            }
                            .padding(.trailing, 16)
                        }
                    }
            }
            .tabItem {
                createTabItem(imageName: "checkmark.bubble.fill", title: "Selesai", index: 3)
            }
            .tag(3)
            
            NavigationView {
                BatalView()
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            HStack {
                                Text(tabNavigationTitle) // Your navigation title
                                    .font(.largeTitle).fontWeight(.bold).padding()
                                Spacer() // Flexible spacer to push the button to the trailing side
                            }
                        }
                        
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: {
                                // Your button action here
                                print("hhhhh")
                            }) {
                                Image(systemName: "plus.circle.fill")
                                    .font(.system(size: 20))
                            }
                            .padding(.trailing, 16)
                        }
                    }
            }
            .tabItem {
                createTabItem(imageName: "x.circle.fill", title: "Batal", index: 4)
            }
            .tag(4)
            
        }.onAppear(){
            readvm.observeStatus(laporanId: 0)
        }
        
    }
    
    private func createTabItem(imageName: String, title: String, index: Int) -> some View {
        VStack {
            ZStack {
                Image(systemName: imageName)
                if selectedTab == index { // Show the dot only for the active tab
                    Circle()
                        .foregroundColor(Color.blue) // Customize the dot color as needed
                        .frame(width: 8, height: 8)
                        .offset(y: -10)
                }
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
