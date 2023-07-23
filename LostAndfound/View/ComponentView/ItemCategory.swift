//
//  ItemCategory.swift
//  LostAndfound
//
//  Created by Deka Primatio on 23/07/23.
//

import SwiftUI

struct ItemCategory: View {
    //MARK: - PROPERTIES
    @State private var isMenuVisible = false
    @State private var selectedCategory: String = "Pilih Kategori Barang"
    
    @Binding var category: String
    
    var body: some View {
        //MARK: - MAIN WRAPPER DROPDOWN KATEGORI BARANG (VSTACK)
        VStack(alignment: .leading) {
            
            //MARK: - PILIH KATEGORI BARANG (BUTTON)
            Button {
                isMenuVisible.toggle()
            } label: {
                //MARK: - PLACEHOLDER KATEGORI BARANG (ZSTACK)
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .frame(width: 343, height: 44)
                        .foregroundColor(Color("FormGray"))

                    HStack {
                        Text(selectedCategory) // Display the selected category

                        Spacer()

                        Image(systemName: isMenuVisible ? "chevron.up" : "chevron.down")
                    }
                    .formTextStyle()
                    .foregroundColor(Color.black)
                    .padding(.horizontal)
                }//: - PLACEHOLDER KATEGORI BARANG (ZSTACK)
            }//: - PILIH KATEGORI BARANG (BUTTON)

            //MARK: - MENU KATEGORI BARANG
            if isMenuVisible { // Show the menu only if isMenuVisible is true
                ZStack(alignment: .center) {
                    RoundedRectangle(cornerRadius: 12)
                        .frame(width: 343, height: 206)
                        .foregroundColor(Color("FormGray"))
                    
                    VStack(alignment: .leading) {
                        Button(action: {
                            selectedCategory = "Botol Minum"
                            category = selectedCategory
                            isMenuVisible.toggle() // Hide the menu after selection
                            
                        }) {
                            Text("Botol Minum")
                        }
                        
                        Divider()
                        
                        Button(action: {
                            selectedCategory = "Dompet"
                            category = selectedCategory
                            isMenuVisible.toggle() // Hide the menu after selection
                        }) {
                            Text("Dompet")
                        }
                        
                        Divider()
                        
                        Button(action: {
                            selectedCategory = "Elektronik"
                            category = selectedCategory
                            isMenuVisible.toggle() // Hide the menu after selection
                        }) {
                            Text("Elektronik")
                        }
                        
                        Divider()
                        
                        Button(action: {
                            selectedCategory = "ID Card"
                            category = selectedCategory
                            isMenuVisible.toggle() // Hide the menu after selection
                        }) {
                            Text("ID Card")
                        }
                        
                        Divider()
                        
                        Button(action: {
                            selectedCategory = "Tas"
                            category = selectedCategory
                            isMenuVisible.toggle() // Hide the menu after selection
                        }) {
                            Text("Tas")
                        }
                    }
                    .foregroundColor(Color.black)
                    .padding()
                } //: - MENU KATEGORI BARANG
            }//: - IF STATEMENT MENU KATEGORI BARANG
        }//: - MAIN WRAPPER (VSTACK)
    }
}

struct ItemCategory_Previews: PreviewProvider {
    static var previews: some View {
        ItemCategory(category: .constant(""))
            .padding()
    }
}
