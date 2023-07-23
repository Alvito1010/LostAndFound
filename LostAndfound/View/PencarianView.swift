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
    
    @State var tracks: [ComponentTrack] = []
    
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
    @State var statusLaporan: String = "Pencarian tahap satu di stasiun-stasiun MRT Jakarta."
    @State var colorStatus: String = "green"
    
    var body: some View {
        GeometryReader { geometry in
            VStack (spacing: 0){
                    ZStack(alignment: .top) {
                        Color.gray.opacity(0.2)
                        if !(readvm.status3Bool ?? true) || (readvm.status5Bool ?? false) || (readvm.status6Bool ?? false) || (readvm.status7Bool ?? false) ||
                            (readvm.laporanBatal ?? false){
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
                            Circle().foregroundColor(Color("MRTBlue")).frame(width: 5,height: 5)
                            Spacer()
                        }
                    }
                
                
            }
        }
        
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    updateTracks()
                }
                }
        
                .onChange(of: readvm.status4Bool) { newStatus4Bool in
                    updateTracks()
                }
                .onChange(of: readvm.status3Bool) { newStatus3Bool in
                    updateTracks()
                }
                .onChange(of: readvm.jenisBarang) { newJenisBarang in
                    jenisBarang = newJenisBarang ?? ""
                }
                .onChange(of: readvm.status3Tanggal) { newStatus3Tanggal in
                    if let newStatus3Tanggal = newStatus3Tanggal, let newStatus3Waktu = readvm.status3Waktu, tracks.isEmpty {
                        updateTracks()
                    } else {
                        if let index = tracks.firstIndex(where: { $0.trackingTitle == "Laporan Dibuat" }) {
                            tracks[index].dateMonth = newStatus3Tanggal ?? ""
                            tracks[index].time = readvm.status3Waktu ?? ""
                        }
                    }
                }
            }

            private func updateTracks() {
                if let status3Bool = readvm.status3Bool {
                    if status3Bool && (readvm.status4Bool ?? false) {
                        // Show both tracks when status3Bool is true and status4Bool is true
                        tracks = [
                            ComponentTrack(
                                dateMonth: readvm.status4Tanggal ?? "",
                                time: readvm.status4Waktu ?? "",
                                trackingColor: "green",
                                trackingTitle: "Pencarian Tahap Dua",
                                trackingDescription: "Memasuki proses pencarian di seluruh area stasiun MRT Jakarta.",
                                trackingIcon: "checkmark.circle.fill",
                                trackingStatus: false
                            ),
                            ComponentTrack(
                                dateMonth: readvm.status3Tanggal ?? "",
                                time: readvm.status3Waktu ?? "",
                                trackingColor: "",
                                trackingTitle: "Proses Pencarian",
                                trackingDescription: "Memasuki proses pencarian di lokasi sesuai pelaporan.",
                                trackingIcon: "",
                                trackingStatus: false
                            ),
                            ComponentTrack(
                                dateMonth: readvm.status2Tanggal ?? "",
                                time: readvm.status2Waktu ?? "",
                                trackingColor: "",
                                trackingTitle: "Laporan Diterima",
                                trackingDescription: "Laporan telah diterima oleh petugas MRT Jakarta.",
                                trackingIcon: "",
                                trackingStatus: false
                            ),
                            ComponentTrack(
                                dateMonth: readvm.status1Tanggal ?? "",
                                time: readvm.status1Waktu ?? "",
                                trackingColor: "",
                                trackingTitle: "Laporan Dibuat",
                                trackingDescription: "Laporan telah Dibuat oleh \(readvm.nama ?? "").",
                                trackingIcon: "",
                                trackingStatus: false
                            ),
                        ]
                        statusLaporan = "Pencarian tahap dua di stasiun-stasiun MRT Jakarta." // Change the statusLaporan value here
                        
                        jenisBarang = readvm.jenisBarang ?? ""

                        
                    } else if status3Bool {
                        // Show only the "Laporan Dibuat" track when status3Bool is true and status4Bool is false
                        tracks = [
                            ComponentTrack(
                                dateMonth: readvm.status3Tanggal ?? "",
                                time: readvm.status3Waktu ?? "",
                                trackingColor: "green",
                                trackingTitle: "Proses Pencarian",
                                trackingDescription: "Memasuki proses pencarian di lokasi sesuai pelaporan.",
                                trackingIcon: "checkmark.circle.fill",
                                trackingStatus: false
                            ),
                            ComponentTrack(
                                dateMonth: readvm.status2Tanggal ?? "",
                                time: readvm.status2Waktu ?? "",
                                trackingColor: "",
                                trackingTitle: "Laporan Diterima",
                                trackingDescription: "Laporan telah diterima oleh petugas MRT Jakarta.",
                                trackingIcon: "",
                                trackingStatus: false
                            ),
                            ComponentTrack(
                                dateMonth: readvm.status1Tanggal ?? "",
                                time: readvm.status1Waktu ?? "",
                                trackingColor: "",
                                trackingTitle: "Laporan Dibuat",
                                trackingDescription: "Laporan telah Dibuat oleh \(readvm.nama ?? "").",
                                trackingIcon: "",
                                trackingStatus: false
                            ),
                        ]
                        
                        statusLaporan = "Pencarian tahap satu di stasiun-stasiun MRT Jakarta." // Change the statusLaporan value here
                        
                        jenisBarang = readvm.jenisBarang ?? ""
                        
                    } else {
                        // Show no tracks when both status3Bool and status4Bool are false
                        tracks = []
                    }
                }
            }
        }

struct PencarianView_Previews: PreviewProvider {
    static var previews: some View {
        PencarianView()
    }
}
