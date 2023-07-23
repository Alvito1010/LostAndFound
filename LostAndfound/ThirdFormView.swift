//
//  ThirdFormView.swift
//  LostAndfound
//
//  Created by Deka Primatio on 22/07/23.
//

import SwiftUI

struct ThirdFormView: View {
    //MARK: - PROPERTIES
    @State private var namaLengkap = ""
    @State private var detailLokasi = ""
    @State private var wordCount = 0
    @State var isPickerShowing = false
    @State var selectedImage: UIImage?
    @EnvironmentObject var writevm: WriteViewModel
    
    //MARK: - BODY
    var body: some View {
        VStack(alignment: .center) {
            
            //MARK: - MESSAGES AND DIVIDER
            VStack(alignment: .center) {
                Group {
                    Text("Pengisian laporanmu hampir selesai. Data tambahan berikut ") +
                    Text("tidak wajib diisi namun akan mempermudah kami ")
                        .foregroundColor(Color("MRTBlue"))
                        .fontWeight(.bold) +
                    Text("menemukan barangmu.")
                    
                    Divider()
                        .padding(.vertical, 28)
                }
                .descriptionStyle()
                .padding(.horizontal, 9)
                .multilineTextAlignment(.center)
            }//: - MESSAGES AND DIVIDER
            
            //MARK: - FORMS LOKASI, WAKTU DAN FOTO (VSTACK)
            VStack(alignment: .leading, spacing: 16) {
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
                
                //FORM DETAIL WAKTU
                Section(header: HStack {
                    Text("Detail Waktu")
                        .headerStyle()
                }) {
                    TimePicker()
                }//: - FORM DETAIL WAKTU
                
                //FORM LAMPIRAN FOTO
                Section(header: HStack {
                    Text("Lampiran Foto")
                        .headerStyle()
                }) {
                    HStack {
                        Button{
                                                   isPickerShowing = true
                                               } label: {
                                                   Image(systemName: "plus.circle.fill").foregroundColor(Color("MRTBlue"))
                                               }
                        Text("tambahkan foto referensi barangmu").foregroundColor(Color("TextGray")).font(.system(size: 14))
                    }//: - TEXTFIELD (HSTACK)
                }//: - FORM LAMPIRAN FOTO
                
//                Button {
//                    writevm.uploadImageAndSaveData(nama: "Trial", hp: "Trial", jenis: "Trial", rutePerjalanan: "Trial", deskripsi: "Trial", detailLokasi: "Trial", waktu: "Trial", selectedImage: selectedImage)
//                } label: {
//                    Text("Trial")
//                }

            }//:- FORMS LOKASI, WAKTU DAN FOTO (VSTACK)
            .onChange(of: detailLokasi) { newValue in
                wordCount = min(newValue.count, 100)
            }
            
            Spacer()
            
            //MARK: - BUTTON SELANJUTNYA (VSTACK)
            VStack(alignment: .center) {
                NavigationLink(destination: ConfrimationView(), label: {
                    Text("Selanjutnya")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                        .frame(width: 186, height: 44)
                        .background(
                            RoundedRectangle(cornerRadius: 12, style: .circular)
                                .fill(Color("MRTBlue"))
                        )
                })
            }//: - BUTTON SELANJUTNYA (VSTACK)
        }//: - MAIN WRAPPER (VSTACK)
        .sheet(isPresented: $isPickerShowing){
                            //image Picker
                            ImagePicker(selectedImage: $selectedImage, isPickerShowing: $isPickerShowing)
                            
                        }
        .padding(23)
    }//: - BODY
}

//MARK: - PREVIEW
struct ThirdFormView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdFormView()
    }
}
