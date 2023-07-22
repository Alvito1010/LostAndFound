//
//  HasilView.swift
//  LostAndfound
//
//  Created by Bayu Alif Farisqi on 21/07/23.
//

import SwiftUI

struct HasilView: View {
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
    @State var statusLaporan: String = "Barang telah ditemukan di Stasiun Dukuh Atas. Segera ambil barang sebelum 18 Agustus 2023 di Pusat Informasi Stasiun Dukuh Atas."
    @State var colorStatus: String = "green"

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                ZStack(alignment: .top) {
                    Color.gray.opacity(0.2)
                    if !(readvm.status5Bool ?? true || readvm.status7Bool ?? true) {
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
                        Spacer().frame(width: UIScreen.main.bounds.width * 0.49)
                        Circle().foregroundColor(.blue).frame(width: 5, height: 5)
                        Spacer()
                    }
                }
            }
        }
        .onAppear {
            updateTracks()
        }
        .onChange(of: readvm.status7Bool) { newStatus7Bool in
            updateTracks()
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
        if let status5Bool = readvm.status5Bool, let status7Bool = readvm.status7Bool {
            if status7Bool && !status5Bool {
                // Show tracks when status7Bool is true and status5Bool is false
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
            } else if !status7Bool && status5Bool {
                // Show tracks when status5Bool is true and status7Bool is false
                tracks = [
                    ComponentTrack(
                        dateMonth: readvm.status5Tanggal ?? "",
                        time: readvm.status5Waktu ?? "",
                        trackingColor: "green",
                        trackingTitle: "Barang Telah Ditemukan",
                        trackingDescription: "Barang telah ditemukan di Stasiun Dukuh Atas. Segera ambil barang sebelum \(readvm.status5Deadline ?? "") di Pusat Informasi Stasiun Dukuh Atas",
                        trackingIcon: "checkmark.circle.fill",
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
            } else {
                // Show no tracks when both status5Bool and status7Bool are false or both are true
                tracks = []
            }
        }
    }

}

struct HasilView_Previews: PreviewProvider {
    static var previews: some View {
        HasilView()
    }
}
