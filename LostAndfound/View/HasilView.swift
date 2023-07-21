//
//  HasilView.swift
//  LostAndfound
//
//  Created by Bayu Alif Farisqi on 21/07/23.
//

import SwiftUI

struct HasilView: View {
    @State var tracks = [
            ComponentTrack(dateMonth: "16 Jul", time: "18:30", trackingColor: "green", trackingTitle: "Barang Telah Ditemukan", trackingDescription: "Barang telah ditemukan di Stasiun Dukuh Atas. Segera ambil barang sebelum 18 Agustus 2023 di Pusat Informasi Stasiun Dukuh Atas.", trackingIcon: "checkmark.circle.fill", trackingStatus: false),
            
            ComponentTrack(dateMonth: "16 Jul", time: "15:30", trackingColor: "", trackingTitle: "Pencarian Tahap Dua", trackingDescription: "Memasuki proses pencarian di seluruh area stasiun MRT Jakarta.", trackingIcon: "", trackingStatus: false),
            ComponentTrack(dateMonth: "15 Jul", time: "13:30", trackingColor: "", trackingTitle: "Proses Pencarian", trackingDescription: "Memasuki proses pencarian di lokasi sesuai pelaporan.", trackingIcon: "", trackingStatus: false),
            ComponentTrack(dateMonth: "14 Jul", time: "09:30", trackingColor: "", trackingTitle: "Laporan Diterima", trackingDescription: "Laporan telah diterima oleh petugas MRT Jakarta.", trackingIcon: "", trackingStatus: false)
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
    @State var detailWaktu: Date = Date()
    @State var lampiranForo: String = ""
    @State var statusLaporan: String = "Barang telah ditemukan di Stasiun Dukuh Atas. Segera ambil barang sebelum 18 Agustus 2023 di Pusat Informasi Stasiun Dukuh Atas."
    @State var colorStatus: String = "green"
    var body: some View{
        VStack {
            ZStack {
                Color.gray.opacity(0.2)
                CardLaporan(noLaporan: noLaporan, nama: nama, noHp: noHp, jenisBarang:jenisBarang , rutePerjalanan: rutePerjalanan, tanggalKehilangan: tanggalKehilangan, deskripsiBarang: deskripsiBarang, detailLokasi: detailLokasi, detailWaktu: detailWaktu, lampiranForo: lampiranForo, statusLaporan: statusLaporan, colorStatus: colorStatus, arrayTrack: tracks)
            }
            ZStack {
                Color.white.frame(height: 8)
                HStack {
                    Spacer().frame(width: UIScreen.main.bounds.width * 0.49)
                    Circle().foregroundColor(.blue).frame(width: 5,height: 5)
                    Spacer()
                }
            }
        }
    }
}

struct HasilView_Previews: PreviewProvider {
    static var previews: some View {
        HasilView()
    }
}
