//
//  SecondFormView.swift
//  LostAndfound
//
//  Created by Deka Primatio on 21/07/23.
//

import SwiftUI

struct SecondFormView: View {
    //MARK: - PROPERTIES
    @Environment(\.presentationMode) var presentationMode
    @State private var deskripsi = ""
    @State private var wordCount = 0
    @State private var selectedDate = Date()
    
    //MARK: - BODY
    var body: some View {
        //MAIN WRAPPER (VSTACK)
        VStack(alignment: .center) {
            
            //MARK: - FORMS (VSTACK)
            VStack(alignment: .leading, spacing: 16) {
                Section(header: HStack {
                    Text("Jenis Barang")
                        .headerStyle()
                }) {
                    ItemCategory()
                }
                
                Section(header: HStack {
                    Text("Rute Perjalanan")
                        .headerStyle()
                }) {
                    RouteCategory()
                }
                
                Section(header: HStack {
                    Text("Tanggal Kehilangan")
                        .headerStyle()
                }) {
                    DatePickerComponent()
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
            }//: - FORMS (VSTACK)
            
            Spacer()
            
            //MARK: - BUTTON SELANJUTNYA (VSTACK)
            VStack(alignment: .center) {
                NavigationLink(destination: ThirdFormView(), label: {
                    Text("Selanjutnya")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(disableForm ? Color("TextGray") : Color.white)
                        .frame(width: 186, height: 44)
                        .background(
                            RoundedRectangle(cornerRadius: 12, style: .circular)
                                .fill(disableForm ? Color("ButtonGray") : Color("MRTBlue"))
                        )
                })
                .disabled(disableForm)
            }//: - BUTTON SELANJUTNYA (VSTACK)
        }//: - MAIN WRAPPER (VSTACK)
        .padding(23)
        .onChange(of: deskripsi) { newValue in
            wordCount = min(newValue.count, 100)
        }
    }//: - BODY
    
    //MARK: - PRIVATE LOGIC FOR BUTTON TOGGLE (DISABLE FORM)
    var disableForm: Bool {
        deskripsi.isEmpty || deskripsi.count < 10
    }
    
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
