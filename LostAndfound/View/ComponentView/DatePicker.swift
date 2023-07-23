//
//  DatePicker.swift
//  LostAndfound
//
//  Created by Deka Primatio on 23/07/23.
//

import SwiftUI

struct DatePickerComponent: View {
    //MARK: - PROPERTIES
    @State private var isMenuVisible = false
    @State private var selectedCategory: String = ""
    @State private var selectedDate = Date()
    
    @Binding var date: Date
    
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
                        Text(selectedCategory.isEmpty ? formattedDate(selectedDate) : selectedCategory)
                        
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
                DatePicker("Select a Date", selection: $selectedDate, displayedComponents: .date)
                    .datePickerStyle(WheelDatePickerStyle())
                    .labelsHidden()
                    .padding(.horizontal)
                
                // Done Button
                HStack {
                    Spacer()
                    Button("Pilih Tanggal") {
                        date = selectedDate
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
    
    //MARK: - DATE FORMATTER
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMMM yyyy"
        return formatter.string(from: date)
    }//: - DATE FORMATTER
}

//MARK: - PREVIEW
struct DatePickerComponent_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerComponent(date: .constant(Date()))
            .padding()
    }
}
