//
//  LandingPageView.swift
//  LostAndfound
//
//  Created by Alvito . on 19/07/23.
//

import SwiftUI

struct LandingPageView: View {
    @EnvironmentObject var writevm: WriteViewModel
    @State var text1 = "ggggggg"
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationView {
                LaporanView()
                    .navigationBarTitle("") // Use an empty title to adjust the alignment
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
                createTabItem(imageName: "exclamationmark.bubble.fill", title: "Laporan", index: 0)
            }
            .tag(0)
            
            NavigationView {
                PencarianView()
                    .navigationBarTitle("")
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
                    .navigationBarTitle("")
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
                    .navigationBarTitle("")
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
                    }            }
            .tabItem {
                createTabItem(imageName: "checkmark.bubble.fill", title: "Selesai", index: 3)
            }
            .tag(3)
            
            NavigationView {
                BatalView()
                    .navigationBarTitle("")
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

struct LaporanView: View {
    var body: some View {
        VStack {
            ZStack {
                Color.gray.opacity(0.25)
            }
            
            ZStack {
                Color.white.frame(height: 8)
                HStack {
                    Spacer().frame(width: UIScreen.main.bounds.width * 0.093)
                    Circle().foregroundColor(.blue).frame(width: 5,height: 5)
                    Spacer()
                }
            }
        }
    }
}

struct PencarianView: View {
    @EnvironmentObject var writevm: WriteViewModel
    var body: some View {
        VStack {
            ZStack {
                Color.gray.opacity(0.3)
                Button {
                    // Your button action here
                    writevm.createPath(nama: "Bayu", hp: "0818888888", jenis: "elektronik", rutePerjalanan: "Bundaran HI - Lebak Bulus", deskripsi: "Deskripsi barang hiya hiya hiya hiya", detailLokasi: "Kereta", waktu: "09:00 - 10:00")
                    
                } label: {
                    Image(systemName: "plus.circle.fill").font(.system(size: 20))
                }
            }
            
            ZStack {
                Color.white.frame(height: 8)
                HStack {
                    Spacer().frame(width: UIScreen.main.bounds.width * 0.288)
                    Circle().foregroundColor(.blue).frame(width: 5,height: 5)
                    Spacer()
                }
            }
        }
    }
}

struct HasilView: View {
    var body: some View{
        VStack {
            ZStack {
                Color.gray.opacity(0.3)
            }
            
            ZStack {
                Color.white.frame(height: 8)
                HStack {
                    Spacer().frame(width: UIScreen.main.bounds.width * 0.49)
                    Circle().foregroundColor(.blue).frame(width: 5,height: 5)
                    Spacer()
                }
            }
        }
    }
}

struct SelesaiView: View {
    var body: some View{
        VStack {
            ZStack(alignment: .top) {
                Color.gray.opacity(0.2)
                VStack{
//                    ScrollView{
                        SubSelesaiView()
//                    }
                }
            }
            ZStack {
                Color.white.frame(height: 8)
                HStack {
                    Spacer().frame(width: UIScreen.main.bounds.width * 0.692)
                    Circle().foregroundColor(.blue).frame(width: 5,height: 5)
                    Spacer()
                }
            }
        }
    }
}

struct BatalView: View {
    var body: some View{
        VStack {
            ZStack(alignment: .top) {
                Color.gray.opacity(0.2)
                VStack{
//                    ScrollView{
                        SubBatalView()
//                    }
                }
            }
            ZStack {
                Color.white.frame(height: 8)
                HStack {
                    Spacer().frame(width: UIScreen.main.bounds.width * 0.892)
                    Circle().foregroundColor(.blue).frame(width: 5,height: 5)
                    Spacer()
                }
            }
        }
    }
}
