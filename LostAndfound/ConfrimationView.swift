//
//  ConfrimationView.swift
//  LostAndfound
//
//  Created by Deka Primatio on 22/07/23.
//

import SwiftUI

struct ConfrimationView: View {
    //MARK: - PROPERTIES
    
    //DARI FORM PERTAMA
    @State var namaLengkap: String
    @State var noHP: String
    
    //DARI FORM KEDUA
    @State var itemCategory: String
    @State var deskripsi: String
    @State var routeCategory: String
    @State var date: Date
    
    //DARI FORM KETIGA
    @State var detailLokasi: String
    @State var time: Date
    
    @State private var wordCount = 0
    
    //MARK: - BODY
    var body: some View {
        //MARK: - HEADER & TEXTFIELD FORM (VSTACK)
        ScrollView {
            Spacer()
            
            VStack(alignment: .center) {
                VStack(alignment: .leading, spacing: 10) {
                    //FORM NAMA LENGKAP
                    Section(header: HStack {
                        Text("Nama Lengkap")
                            .headerStyle()
                    }) {
                        HStack {
                            TextField("Nama sesuai KTP", text: $namaLengkap)
                                .textFieldStyle(.roundedBorder)
                                .disabled(true)
                                .overlay(
                                    Image(systemName: "xmark.circle.fill")
                                        .padding()
                                        .offset(x: 10)
                                        .foregroundColor(Color.accentColor)
                                        .opacity(namaLengkap.isEmpty ? 0.0 : 1.0)
                                        .onTapGesture {
                                            namaLengkap = ""
                                        },
                                    alignment: .trailing
                                ) //: - OVERLAY X MARK FOR DELETE CURRENT TEXT
                        } //: - TEXTFIELD (HSTACK)
                    }//: - FORM NAMA LENGKAP
                    
                    //FORM NOMOR HP
                    Section(header: HStack {
                        Text("Nomor HP")
                            .headerStyle()
                    }) {
                        HStack {
                            TextField("Contoh: 081234567891", text: $noHP)
                                .textFieldStyle(.roundedBorder)
                                .keyboardType(.decimalPad)
                                .disabled(true)
                                .overlay(
                                    Image(systemName: "xmark.circle.fill")
                                        .padding()
                                        .offset(x: 10)
                                        .foregroundColor(Color.accentColor)
                                        .opacity(noHP.isEmpty ? 0.0 : 1.0) // Corrected to use noHP
                                        .onTapGesture {
                                            noHP = ""
                                        },
                                    alignment: .trailing
                                ) //: - OVERLAY X MARK FOR DELETE THE CURRENT TEXT
                        }//: - TEXTFIELD (HSTACK)
                    }//: - FORM NOMOR HP
                    
                    //FORM JENIS BARANG
                    Section(header: HStack {
                        Text("Jenis Barang")
                            .headerStyle()
                    }) {
                        HStack {
                            TextField("Jenis Barang", text: $itemCategory)
                                .textFieldStyle(.roundedBorder)
                                .keyboardType(.decimalPad)
                                .disabled(true)
                        }//: - TEXTFIELD (HSTACK)
                    }//: - FORM JENIS BARANG
                    
                    //FORM RUTE PERJALANAN
                    Section(header: HStack {
                        Text("Rute Perjalanan")
                            .headerStyle()
                    }) {
                        HStack {
                            TextField("Rute Perjalanan", text: $routeCategory)
                                .textFieldStyle(.roundedBorder)
                                .keyboardType(.decimalPad)
                                .disabled(true)
                        }//: - TEXTFIELD (HSTACK)
                    }//: - FORM RUTE PERJALANAN
                    
                    //FORM TANGGAL KEHILANGAN
                    Section(header: HStack {
                        Text("Tanggal Kehilangan")
                            .headerStyle()
                    }) {
                        HStack {
                            Text(formattedDate(date))
                            
                            Spacer()
                            
                            Image("chevron.down")
                        }
                        .foregroundColor(Color.black)
                        .padding(.horizontal)
                        //: - TEXTFIELD (HSTACK)
                    }//: - FORM TANGGAL KEHILANGAN
                    
                    //FORM DESKRIPSI BARANG
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
                    }//: - FORM DESKRIPSI BARANG
                    .onChange(of: deskripsi) { newValue in
                        wordCount = min(newValue.count, 100)
                    }
                    
                    //FORM DETAIL LOKASI
                    Section(header: HStack {
                        Text("Detail Lokasi")
                            .headerStyle()
                    }) {
                        TextField("Contoh: tertinggal di area toilet wanita stasiun lebak bulus grab.", text: $detailLokasi, axis: .vertical)
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
                    }//: - FORM DETAIL LOKASI
                    .onChange(of: detailLokasi) { newValue in
                        wordCount = min(newValue.count, 100)
                    }
                    
                    //FORM DETAIL WAKTU
                    Section(header: HStack {
                        Text("Detail Waktu")
                            .headerStyle()
                    }) {
                        HStack {
                            Text(formattedDate(time))
                            
                            Spacer()
                            
                            Image("chevron.down")
                        }
                        .foregroundColor(Color.black)
                        .padding(.horizontal)//: - TEXTFIELD (HSTACK)
                    }//: - FORM DETAIL WAKTU
                    
                    //FORM LAMPIRAN FOTO
                    Section(header: HStack {
                        Text("Lampiran Foto")
                            .headerStyle()
                    }) {
                        HStack {
                            TextField("Lampiran Foto", text: $noHP)
                                .textFieldStyle(.roundedBorder)
                                .keyboardType(.decimalPad)
                        }//: - TEXTFIELD (HSTACK)
                    }//: - FORM LAMPIRAN FOTO
                    
                }//: - HEADER & TEXTFIELD FORM (VSTACK)
                .padding(.horizontal, 23)
                
                //BUTTON
                Button {
                    //TODO: - Popup Confrimation
                } label: {
                    Text("Ajukan Laporan")
                        .activeButtonStyle()
                }
                .padding(.vertical, 50)
            }//: - MAIN WRAPPER (VSTACK)
        }//SCROLLVIEW CONTENT
    }//: - BODY
    
    
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMMM yyyy"
        return formatter.string(from: date)
    }//: - DATE FORMATTER
}

//MARK: - PREVIEW
struct ConfrimationView_Previews: PreviewProvider {
    static var previews: some View {
        ConfrimationView(namaLengkap: "", noHP: "", itemCategory: "", deskripsi: "", routeCategory: "", date: Date(), detailLokasi: "", time: Date())
    }
}
