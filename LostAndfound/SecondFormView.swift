//
//  SecondFormView.swift
//  LostAndfound
//
//  Created by Deka Primatio on 21/07/23.
//

import SwiftUI

struct SecondFormView: View {
    //MARK: - PROPERTIES
    @State private var deskripsi = ""
    @State private var wordCount = 0
    @State private var placeholderJenisBarang = "Pilih Kategori Barang"
    @State private var selectedDate = Date()
    
    let jenisBarang = ["Botol Minum", "Dompet", "Elektronik", "ID Card", "Tas", "Lainnya"]
    let rutePerjalanan = ["Lebak Bulus - Bundaran HI", "Bundaran HI - Lebak Bulus"]
    
    //MARK: - BODY
    var body: some View {
        //MAIN WRAPPER (VSTACK)
        VStack(alignment: .center) {
            
            VStack(alignment: .leading) {
                Section(header: HStack {
                    Text("Jenis Barang")
                        .headerStyle()
                }) {
                    Picker("Pilih Kategori Barang", selection: $placeholderJenisBarang) {
                        ForEach(jenisBarang, id: \.self) { option in
                            Text(option)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                
                Section(header: HStack {
                    Text("Rute Perjalanan")
                        .headerStyle()
                }) {
                    Picker("Pilih Kategori Barang", selection: $placeholderJenisBarang) {
                        ForEach(rutePerjalanan, id: \.self) { option in
                            Text(option)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                
                Section(header: HStack {
                    Text("Tanggal Kehilangan")
                        .headerStyle()
                }) {
                    DatePicker("Select a Date", selection: $selectedDate, displayedComponents: .date)
                        .datePickerStyle(WheelDatePickerStyle())
                        .labelsHidden()
                        .padding(.horizontal)
                }
                
                Section(header: HStack {
                    Text("Deskripsi Barang")
                        .headerStyle()
                }) {
                    TextField("Contoh: botol minum tupperware kuning ukuran 750ml. Terdapat stiker ditutup botolnya.", text: $deskripsi, axis: .vertical)
                        .lineLimit(5, reservesSpace: true)
                        .textFieldStyle(.roundedBorder)
                        .overlay(
                            Text("\n\n\n\n\n\n\n\n\n \(wordCount)/100")
                                .foregroundColor(wordCount < 100 ? Color("TextGray") : Color.red)
                                .padding(8)
                                .font(.caption)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        )
                        .disabled(wordCount >= 100)
                }
            }
            
            Spacer()
            
            //MARK: - BUTTON SELANJUTNYA
            VStack(alignment: .center) {
                Button {
                    
                } label: {
                    Text("Selanjutnya")
                        .frame(width: 200, height: 50, alignment: .center)
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .fontWeight(.bold)
                        .cornerRadius(8)
                }
            }//: - BUTTON SELANJUTNYA
            
        }//: - MAIN WRAPPER (VSTACK)
        .padding(23)
        .onChange(of: deskripsi) { newValue in
            wordCount = min(newValue.count, 100)
        }
    }//: - BODY
    
    //MARK: - DATE FORMATTER
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter.string(from: date)
    }//: - DATE FORMATTER
}

//MARK: - PREVIEW
struct SecondFormView_Previews: PreviewProvider {
    static var previews: some View {
        SecondFormView()
    }
}
