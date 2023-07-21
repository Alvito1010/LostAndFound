//
//  LaporanView.swift
//  LostAndfound
//
//  Created by Bayu Alif Farisqi on 21/07/23.
//

import SwiftUI

struct LaporanView: View {
    @EnvironmentObject var writevm: WriteViewModel
    @EnvironmentObject var readvm: ReadViewModel
    //DATA TRACK
    @State var tracks: [ComponentTrack] = []
    //DATA CARD LAPORAN
    @State var noLaporan: String = "LB140720230408"
    @State var nama: String = "Deka"
    @State var noHp: String = "0897986435"
    @State var jenisBarang: String = "elektronik"
    @State var rutePerjalanan: String = ""
    @State var tanggalKehilangan: Date = Date()
    @State var deskripsiBarang: String = ""
    @State var detailLokasi: String = ""
    @State var detailWaktu: String = ""
    @State var lampiranFoto: String = ""
    @State var statusLaporan: String = "Laporan telah diterima oleh petugas MRT Jakarta."
    @State var colorStatus: String = "green"
    
//    init() {
//            _nama = State(initialValue: readvm.nama ?? "")
//            _noHp = State(initialValue: readvm.noHp ?? "")
//        }
    
    var body: some View {
        VStack {
                ZStack(alignment: .top) {
                    Color.gray.opacity(0.2)
                    if !(readvm.status1Bool ?? true) {
                        // Show the button if readvm.status1Bool is false
                        VStack{
                            Spacer()
                            Text("Kamu kehilangan barang? Jangan panik!")
                            Text(" Tenang saja kami akan bantu kamu menemukannya.")
                                    .foregroundColor(.blue) // Set the color of the second sentence to blue
                            + Text(" Silahkan isi laporan kehilangan berikut!")
                                // Set the color of the third sentence to black

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
                    Color.white.frame(height: 8)
                    HStack {
                        Spacer().frame(width: UIScreen.main.bounds.width * 0.093)
                        Circle().foregroundColor(.blue).frame(width: 5,height: 5)
                        Spacer()
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
        .onChange(of: readvm.nama) { newName in
            nama = newName ?? ""
        }
        .onChange(of: readvm.noHp) { newNoHp in
            noHp = newNoHp ?? ""
        }
        .onChange(of: readvm.jenisBarang) { newJenisBarang in
            jenisBarang = newJenisBarang ?? ""
        }
        .onChange(of: readvm.rutePerjalanan) { newRutePerjalanan in
            rutePerjalanan = newRutePerjalanan ?? ""
        }
        .onChange(of: readvm.detailLokasi) { newDetailLokasi in
            detailLokasi = newDetailLokasi ?? ""
        }
        .onChange(of: readvm.waktu) { newWaktu in
            detailWaktu = newWaktu ?? ""
        }
        .onChange(of: readvm.deskripsiBarang) { newDeskripsiBarang in
            deskripsiBarang = newDeskripsiBarang ?? ""
        }
    }
}

struct LaporanView_Previews: PreviewProvider {
    static var previews: some View {
        LaporanView()
    }
}
