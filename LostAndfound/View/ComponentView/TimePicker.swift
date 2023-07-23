//
//  TimePicker.swift
//  LostAndfound
//
//  Created by Deka Primatio on 23/07/23.
//

import SwiftUI

struct TimePicker: View {
    //MARK: - PROPERTIES
    @State private var isMenuVisible = false
    @State private var selectedCategory: String = "Pilih Waktu Kehilangan"
    @State private var selectedTime = Date() // Changed variable name to selectedTime
    
    @Binding var time: Date
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
                    Button("Pilih Waktu") {
                        updateSelectedCategory()
                        time = selectedTime
                        isMenuVisible = false
                    }
                    .frame(width: 150, height: 30, alignment: .center)
                    .background(Color("MRTBlue"))
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)
                    .cornerRadius(12)
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

struct TimePicker_Previews: PreviewProvider {
    static var previews: some View {
        TimePicker(time: .constant(Date()))
            .padding()
    }
}
