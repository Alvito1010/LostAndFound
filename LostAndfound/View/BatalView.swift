//
//  BatalView.swift
//  LostAndfound
//
//  Created by Bayu Alif Farisqi on 21/07/23.
//

import SwiftUI

struct BatalView: View {
    @EnvironmentObject var writevm: WriteViewModel
    @EnvironmentObject var readvm: ReadViewModel
    
    @State var tracks: [ComponentTrack] = []
    
    //DATA CARD LAPORAN
    @State var noLaporan: String = "LB140720230408"
    @State var nama: String = "Deka"
    @State var noHp: String = "0897986435"
    @State var jenisBarang: String = "elektronik"
    @State var rutePerjalanan: String = "Lebak Bulus - Duku Atas"
    @State var tanggalKehilangan: Date = Date()
    @State var deskripsiBarang: String = "Earphone hitam merk samsung dengan case"
    @State var detailLokasi: String = "Di peron atau di food court"
    @State var detailWaktu: String = "hari senin pagi jam 10"
    @State var lampiranFoto: String = ""
    @State var statusLaporan: String = "Laporan dibatalkan"
    @State var colorStatus: String = "red"
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                ZStack(alignment: .top) {
                    Color.gray.opacity(0.2)
                    if !(readvm.laporanBatal ?? false) {
                        // Show the button if readvm.status5Bool is false
                        VStack {
                            Spacer()
                            Group {
                                Text("Kamu kehilangan barang? Jangan panik! ") +
                                Text("Tenang saja kami akan bantu kamu menemukannya. ")
                                    .foregroundColor(Color("MRTBlue"))
                                    .fontWeight(.bold) +
                                Text("Silahkan isi laporan kehilangan berikut!")
                            }
                            .descriptionStyle()
                            .padding(.horizontal, 30)
                            .multilineTextAlignment(.center)
                            
                            Spacer().frame(height: UIScreen.main.bounds.height * 0.08)
                            Button {
                                // Add the action when the button is tapped
                                // Example: print("tapped")
                            } label: {
                                Text("Buat Laporan")
                                    .activeButtonStyle()
                            }
                            Spacer()
                        }
                    } else {
                        ScrollView {
                            CardLaporan(
                                noLaporan: noLaporan,
                                nama: nama,
                                noHp: noHp,
                                jenisBarang: jenisBarang,
                                rutePerjalanan: rutePerjalanan,
                                tanggalKehilangan: tanggalKehilangan,
                                deskripsiBarang: deskripsiBarang,
                                detailLokasi: detailLokasi,
                                detailWaktu: detailWaktu,
                                lampiranForo: lampiranFoto,
                                statusLaporan: statusLaporan,
                                colorStatus: colorStatus,
                                arrayTrack: tracks
                            )
                        }
                    }
                }
                
                ZStack {
                    Color.white.frame(height: 15)
                    HStack {
                        Spacer().frame(width: UIScreen.main.bounds.width * 0.892)
                        Circle().foregroundColor(Color("MRTBlue")).frame(width: 5, height: 5)
                        Spacer()
                    }
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                nama = readvm.nama ?? ""
                noHp = readvm.noHp ?? ""
                jenisBarang = readvm.jenisBarang ?? ""
                rutePerjalanan = readvm.rutePerjalanan ?? ""
                detailLokasi = readvm.detailLokasi ?? ""
                detailWaktu = readvm.waktu ?? ""
                deskripsiBarang = readvm.deskripsiBarang ?? ""
//                tanggalKehilangan = readvm.
                    updateTracks()
                }
        }
        .onChange(of: readvm.laporanBatal) { newLaporanBatal in
            updateTracks()
        }
        .onChange(of: readvm.jenisBarang) { newJenisBarang in
            jenisBarang = newJenisBarang ?? ""
        }
        .onChange(of: readvm.status3Tanggal) { newStatus3Tanggal in
            if let newStatus3Tanggal = newStatus3Tanggal, let newStatus3Waktu = readvm.status3Waktu, tracks.isEmpty {
                updateTracks()
            } else {
                if let index = tracks.firstIndex(where: { $0.trackingTitle == "Pencarian Tahap Dua" }) {
                    tracks[index].dateMonth = newStatus3Tanggal ?? ""
                    tracks[index].time = readvm.status3Waktu ?? ""
                }
            }
        }
    }
    
    private func updateTracks() {
        if let status6Bool = readvm.status6Bool, let status7Bool = readvm.status7Bool {
            if status7Bool && !status6Bool {
                // Show tracks when status7Bool is true and status6Bool is false
                tracks = [
                    ComponentTrack(
                        dateMonth: readvm.status7Tanggal ?? "",
                        time: readvm.status7Waktu ?? "",
                        trackingColor: "red",
                        trackingTitle: "Barang Tidak Ditemukan",
                        trackingDescription: "Mohon maaf barang tidak ditemukan di seluruh area stasiun MRT Jakarta",
                        trackingIcon: "xmark.circle.fill",
                        trackingStatus: false
                    ),
                    ComponentTrack(
                        dateMonth: readvm.status4Tanggal ?? "",
                        time: readvm.status4Waktu ?? "",
                        trackingColor: "",
                        trackingTitle: "Pencarian Tahap Dua",
                        trackingDescription: "Memasuki proses pencarian di seluruh area stasiun MRT Jakarta.",
                        trackingIcon: "",
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
                
                jenisBarang = readvm.jenisBarang ?? ""
                
            } else if !status7Bool && status6Bool {
                // Show tracks when status6Bool is true and status7Bool is false
                tracks = [
                    ComponentTrack(
                        dateMonth: readvm.status6Tanggal ?? "",
                        time: readvm.status6Waktu ?? "",
                        trackingColor: "green",
                        trackingTitle: "Barang Telah Diambil",
                        trackingDescription: "Barang telah diambil oleh \(readvm.nama ?? "") di \(readvm.lokasiBarang ?? "").",
                        trackingIcon: "checkmark.circle.fill",
                        trackingStatus: false
                    ),
                    ComponentTrack(
                        dateMonth: readvm.status5Tanggal ?? "",
                        time: readvm.status5Waktu ?? "",
                        trackingColor: "",
                        trackingTitle: "Barang Telah Ditemukan",
                        trackingDescription: "Barang telah ditemukan di \(readvm.lokasiBarang ?? ""). Segera ambil barang sebelum  di Pusat Informasi \(readvm.lokasiBarang ?? "").",
                        trackingIcon: "",
                        trackingStatus: false
                    ),
                    ComponentTrack(
                        dateMonth: readvm.status4Tanggal ?? "",
                        time: readvm.status4Waktu ?? "",
                        trackingColor: "",
                        trackingTitle: "Pencarian Tahap Dua",
                        trackingDescription: "Memasuki proses pencarian di seluruh area stasiun MRT Jakarta.",
                        trackingIcon: "",
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
                
                jenisBarang = readvm.jenisBarang ?? ""
                colorStatus = "red"
                statusLaporan = "Laporan dibatalkan"
            } else {
                // Show no tracks when both status6Bool and status7Bool are false or both are true
                tracks = []
            }
        }
    }
}

struct BatalView_Previews: PreviewProvider {
    static var previews: some View {
        BatalView()
    }
}
