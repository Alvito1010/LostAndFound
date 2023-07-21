//
//  PencarianView.swift
//  LostAndfound
//
//  Created by Bayu Alif Farisqi on 21/07/23.
//

import SwiftUI

struct PencarianView: View {
    @EnvironmentObject var writevm: WriteViewModel
    @EnvironmentObject var readvm: ReadViewModel
    @State var tracks = [
        ComponentTrack(dateMonth: "16 Jul", time: "15:30", trackingColor: "green", trackingTitle: "Pencarian Tahap Dua", trackingDescription: "Memasuki proses pencarian di seluruh area stasiun MRT Jakarta.", trackingIcon: "checkmark.circle.fill", trackingStatus: false),
        ComponentTrack(dateMonth: "15 Jul", time: "13:30", trackingColor: "", trackingTitle: "Proses Pencarian", trackingDescription: "Memasuki proses pencarian di lokasi sesuai pelaporan.", trackingIcon: "", trackingStatus: false),
        ComponentTrack(dateMonth: "14 Jul", time: "09:30", trackingColor: "", trackingTitle: "Laporan Diterima", trackingDescription: "Laporan telah diterima oleh petugas MRT Jakarta.", trackingIcon: "", trackingStatus: false),
        ]
    //DATA CARD LAPORAN
    @State var noLaporan: String = "LB140720230408"
    @State var nama: String = "Joe taslim"
    @State var noHp: String = "0897986435"
    @State var jenisBarang: String = "elektronik"
    @State var rutePerjalanan: String = ""
    @State var tanggalKehilangan: Date = Date()
    @State var deskripsiBarang: String = ""
    @State var detailLokasi: String = ""
    @State var detailWaktu: String = ""
    @State var lampiranFoto: String = ""
    @State var statusLaporan: String = "Memasuki proses pencarian di seluruh area stasiun MRT Jakarta."
    @State var colorStatus: String = "green"
    
    var body: some View {
        GeometryReader { geometry in
            VStack (spacing: 0){
                    ZStack(alignment: .top) {
                        Color.gray.opacity(0.2)
                        if !(readvm.status2Bool ?? true) {
                            // Show the button if readvm.status1Bool is false
                            VStack{
                                Spacer()
                                Group {
                                    Text("Kamu kehilangan barang? Jangan panik! ") +
                                    Text("Tenang saja kami akan bantu kamu menemukannya. ")
                                        .foregroundColor(Color("MRTBlue"))
                                        .fontWeight(.bold) +
                                    Text("Silahkan isi laporan kehilangan berikut!")
                                }.descriptionStyle()
                                    .padding(.horizontal, 30)
                                    .multilineTextAlignment(.center)

                                Spacer().frame(height: UIScreen.main.bounds.height * 0.08)
                                Button {
                //                    print("tapped")
                                } label: {
                                    Text("Buat Laporan")
                                        .activeButtonStyle()
                                }
                                Spacer()
                            }
                            
                            
                        } else {
                            ScrollView{
                                CardLaporan(noLaporan: noLaporan, nama: nama, noHp: noHp, jenisBarang:jenisBarang , rutePerjalanan: rutePerjalanan, tanggalKehilangan: tanggalKehilangan, deskripsiBarang: deskripsiBarang, detailLokasi: detailLokasi, detailWaktu: detailWaktu, lampiranForo: lampiranFoto, statusLaporan: statusLaporan, colorStatus: colorStatus, arrayTrack: tracks)
                            }
                        }
                        
                    }
                    
        //            Button("test") {
        //                print(nama)
        //                print(noHp)
        //                print(jenisBarang)
        //                print(detailWaktu)
        //                print(detailLokasi)
        //                print(rutePerjalanan)
        //                print(deskripsiBarang)
        //            }
                    
                    ZStack {
                        Color.white.frame(height: 15)
                        HStack {
                            Spacer().frame(width: UIScreen.main.bounds.width * 0.288)
                            Circle().foregroundColor(.blue).frame(width: 5,height: 5)
                            Spacer()
                        }
                    }
                
                
            }
        }
        
        .onChange(of: readvm.status1Tanggal) { newStatus1Tanggal in
                    // Update the ComponentTrack with the new date
                    if let index = tracks.firstIndex(where: { $0.trackingTitle == "Laporan Diterima" }) {
                        tracks[index].dateMonth = newStatus1Tanggal ?? ""
                    }
                }
        .onChange(of: readvm.status1Tanggal) { newStatus1Tanggal in
                    // Check if status1Tanggal is not nil and tracks is empty
                    if let newStatus1Tanggal = newStatus1Tanggal, tracks.isEmpty {
                        tracks = [
                            ComponentTrack(dateMonth: newStatus1Tanggal, time: "09:30", trackingColor: "green", trackingTitle: "Laporan Diterima", trackingDescription: "Laporan telah diterima oleh petugas MRT Jakarta.", trackingIcon: "checkmark.circle.fill", trackingStatus: false)
                        ]
                    }
                }
        .onChange(of: readvm.status1Waktu) { newStatus1Waktu in
                    // Update the time of the ComponentTrack
                    if let index = tracks.firstIndex(where: { $0.trackingTitle == "Laporan Diterima" }) {
                        tracks[index].time = newStatus1Waktu ?? ""
                    }
                }
    }
}

struct PencarianView_Previews: PreviewProvider {
    static var previews: some View {
        PencarianView()
    }
}
