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
    @State var lampiranForo: String = ""
    @State var statusLaporan: String = "Memasuki proses pencarian di seluruh area stasiun MRT Jakarta."
    @State var colorStatus: String = "green"
    
    var body: some View {
        VStack {
            ZStack {
                Color.gray.opacity(0.2)
                CardLaporan(noLaporan: noLaporan, nama: nama, noHp: noHp, jenisBarang:jenisBarang , rutePerjalanan: rutePerjalanan, tanggalKehilangan: tanggalKehilangan, deskripsiBarang: deskripsiBarang, detailLokasi: detailLokasi, detailWaktu: detailWaktu, lampiranForo: lampiranForo, statusLaporan: statusLaporan, colorStatus: colorStatus, arrayTrack: tracks)
//                Button {
//                    // Your button action here
//                    writevm.createPath(nama: "Bayu", hp: "0818888888", jenis: "elektronik", rutePerjalanan: "Bundaran HI - Lebak Bulus", deskripsi: "Deskripsi barang hiya hiya hiya hiya", detailLokasi: "Kereta", waktu: "09:00 - 10:00")
//                    
//                } label: {
//                    Image(systemName: "plus.circle.fill").font(.system(size: 20))
//                }
            }
            
            ZStack {
                Color.white.frame(height: 8)
                HStack {
                    Spacer().frame(width: UIScreen.main.bounds.width * 0.288)
                    Circle().foregroundColor(.blue).frame(width: 5,height: 5)
                    Spacer()
                }
            }
        }
    }
}

struct PencarianView_Previews: PreviewProvider {
    static var previews: some View {
        PencarianView()
    }
}
