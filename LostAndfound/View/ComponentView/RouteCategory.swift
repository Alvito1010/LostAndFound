//
//  RouteCategory.swift
//  LostAndfound
//
//  Created by Deka Primatio on 23/07/23.
//

import SwiftUI

struct RouteCategory: View {
    //MARK: - PROPERTIES
    @State private var isMenuVisible = false
    @State private var selectedRoute: String = "Pilih Rute Perjalanan"
    
    //MARK: - BODY
    var body: some View {
        //MARK: - MAIN WRAPPER DROPDOWN RUTE PERJALANAN (VSTACK)
        VStack(alignment: .leading) {
            
            //MARK: - PILIH RUTE PERJALANAN (BUTTON)
            Button {
                isMenuVisible.toggle()
            } label: {
                //MARK: - PLACEHOLDER KATEGORI BARANG (ZSTACK)
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .frame(width: 343, height: 44)
                        .foregroundColor(Color("FormGray"))

                    HStack {
                        Text(selectedRoute) // Display the selected route

                        Spacer()

                        Image(systemName: isMenuVisible ? "chevron.up" : "chevron.down")
                    }
                    .formTextStyle()
                    .foregroundColor(Color.black)
                    .padding(.horizontal)
                }//: - PLACEHOLDER RUTE PERJALANAN (ZSTACK)
            }//: - PILIH RUTE PERJALANAN (BUTTON)

            //MARK: - MENU RUTE PERJALANAN
            if isMenuVisible { // Show the menu only if isMenuVisible is true
                ZStack(alignment: .center) {
                    RoundedRectangle(cornerRadius: 12)
                        .frame(width: 343, height: 96)
                        .foregroundColor(Color("FormGray"))
                    
                    VStack(alignment: .leading) {
                        Button(action: {
                            selectedRoute = "Lebak Bulus - Bundaran HI"
                            isMenuVisible.toggle() // Hide the menu after selection
                        }) {
                            Text("Lebak Bulus - Bundaran HI")
                        }
                        
                        Divider()
                        
                        Button(action: {
                            selectedRoute = "Bundaran HI - Lebak Bulus"
                            isMenuVisible.toggle() // Hide the menu after selection
                        }) {
                            Text("Bundaran HI - Lebak Bulus")
                        }
                    }
                    .foregroundColor(Color.black)
                    .padding()
                } //: - MENU RUTE PERJALANAN
            }//: - IF STATEMENT MENU RUTE PERJALANAN
        }//: - MAIN WRAPPER (VSTACK)
    }//: - BODY
}

//MARK: - PREVIEW
struct RouteCategory_Previews: PreviewProvider {
    static var previews: some View {
        RouteCategory()
            .padding()
    }
}
