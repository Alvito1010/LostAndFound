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
                    .navigationBarTitle(tabNavigationTitle)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            VStack {
                                Spacer().frame(height: 90)
                                HStack {
                                    Spacer().frame(width: 340)
                                    Button {
                                        // Your button action here
                                    } label: {
                                        Image(systemName: "plus.circle.fill").font(.system(size: 20))
                                    }
                                .padding(.trailing, 16)
                                } // Adjust the padding as needed
                            }
                        }
                    }
            }

            .tabItem {
                createTabItem(imageName: "exclamationmark.bubble.fill", title: "Laporan", index: 0)
            }
            .tag(0)
            
            NavigationView {
                PencarianView()
                    .navigationBarTitle(tabNavigationTitle)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            VStack {
                                Spacer().frame(height: 90)
                                HStack {
                                    Spacer().frame(width: 340)
                                    Button {
                                        // Your button action here
                                    } label: {
                                        Image(systemName: "plus.circle.fill").font(.system(size: 20))
                                    }
                                .padding(.trailing, 16)
                                } // Adjust the padding as needed
                            }
                        }
                    }
            }
            .tabItem {
                createTabItem(imageName: "magnifyingglass", title: "Pencarian", index: 1)
            }
            .tag(1)
            
            NavigationView {
                HasilView()
                    .navigationBarTitle(tabNavigationTitle)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            VStack {
                                Spacer().frame(height: 90)
                                HStack {
                                    Spacer().frame(width: 340)
                                    Button {
                                        // Your button action here
                                    } label: {
                                        Image(systemName: "plus.circle.fill").font(.system(size: 20))
                                    }
                                .padding(.trailing, 16)
                                } // Adjust the padding as needed
                            }
                        }
                    }
            }
            .tabItem {
                createTabItem(imageName: "archivebox.fill", title: "Hasil", index: 2)
            }
            .tag(2)
            
            NavigationView {
                
                SelesaiView()
                    .navigationBarTitle(tabNavigationTitle)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            VStack {
                                Spacer().frame(height: 90)
                                HStack {
                                    Spacer().frame(width: 340)
                                    Button {
                                        // Your button action here
                                    } label: {
                                        Image(systemName: "plus.circle.fill").font(.system(size: 20))
                                    }
                                .padding(.trailing, 16)
                                } // Adjust the padding as needed
                            }
                        }
                    }
            }
            .tabItem {
                createTabItem(imageName: "checkmark.bubble.fill", title: "Selesai", index: 3)
            }
            .tag(3)
            
            NavigationView {
                BatalView()
                    .navigationBarTitle(tabNavigationTitle)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            VStack {
                                Spacer().frame(height: 90)
                                HStack {
                                    Spacer().frame(width: 340)
                                    Button {
                                        // Your button action here
                                    } label: {
                                        Image(systemName: "plus.circle.fill").font(.system(size: 20))
                                    }
                                .padding(.trailing, 16)
                                } // Adjust the padding as needed
                            }
                        }
                    }
            }
            .tabItem {
                createTabItem(imageName: "x.circle.fill", title: "Batal", index: 4)
            }
            .tag(4)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("trial") {
                    writevm.pushNewValue(username: text1, steps: "jjj")
                }
            }
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
    var body: some View {
        VStack {
            ZStack {
                Color.gray.opacity(0.3)
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
