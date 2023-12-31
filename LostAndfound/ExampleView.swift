//
//  SwiftUIView.swift
//  LostAndfound
//
//  Created by Deka Primatio on 21/07/23.
//

import SwiftUI

struct SwiftUIView: View {
    //MARK: - PROPERTIES
    @State private var isMenuVisible = false
    @State private var selectedCategory: String = "Pilih Waktu Kehilangan"
    @State private var selectedTime = Date() // Changed variable name to selectedTime
    
    //MARK: - BODY
    var body: some View {
        
        //MARK: - MAIN WRAPPER (VSTACK)
        VStack(alignment: .leading) {
            
            //BUTTON PILIH TANGGAL
            Button {
                isMenuVisible.toggle()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .frame(width: 343, height: 44)
                        .foregroundColor(Color("FormGray"))
                    
                    HStack {
                        Text(selectedCategory)
                        
                        Spacer()
                        
                        Image(systemName: isMenuVisible ? "chevron.up" : "chevron.down")
                    }
                    .formTextStyle()
                    .foregroundColor(Color.black)
                    .padding(.horizontal)
                }//: - LABEL WRAPPER (ZSTACK)
            }//: - BUTTON PILIH TANGGAL
            
            //MARK: - LOGIC PEMILIHAN TANGGAL (IF STATEMENT)
            if isMenuVisible {
                DatePicker("Select a Time", selection: $selectedTime, displayedComponents: .hourAndMinute)
                    .datePickerStyle(WheelDatePickerStyle())
                    .labelsHidden()
                    .padding(.horizontal)
                
                // Done Button
                HStack {
                    Spacer()
                    Button("Selesai") {
                        updateSelectedCategory()
                        isMenuVisible = false
                    }
                    .foregroundColor(.blue)
                    .padding(.trailing)
                }
            }//: - LOGIC PEMILIHAN TANGGAL (IF STATEMENT)
        }//: - MAIN WRAPPER (VSTACK)
    }//: - BODY
    
    //MARK: - FUNCTIONS
    func updateSelectedCategory() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm" // Set the desired time format
        
        selectedCategory = dateFormatter.string(from: selectedTime)
    }
}

//MARK: - PREVIEW
struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
            .padding()
    }
}
