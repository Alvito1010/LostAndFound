//
//  LaporanView.swift
//  LostAndfound
//
//  Created by Bayu Alif Farisqi on 21/07/23.
//

import SwiftUI

struct LaporanView: View {
    //DATA TRACK
    @State var tracks = [
            ComponentTrack(dateMonth: "14 Jul", time: "09:30", trackingColor: "green", trackingTitle: "Laporan Diterima", trackingDescription: "Laporan telah diterima oleh petugas MRT Jakarta.", trackingIcon: "checkmark.circle.fill", trackingStatus: false)
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
    @State var statusLaporan: String = "Laporan telah diterima oleh petugas MRT Jakarta."
    @State var colorStatus: String = "green"
    
    var body: some View {
        VStack {
            ZStack(alignment: .top) {
                Color.gray.opacity(0.2)
                ScrollView{
                    CardLaporan(noLaporan: noLaporan, nama: nama, noHp: noHp, jenisBarang:jenisBarang , rutePerjalanan: rutePerjalanan, tanggalKehilangan: tanggalKehilangan, deskripsiBarang: deskripsiBarang, detailLokasi: detailLokasi, detailWaktu: detailWaktu, lampiranForo: lampiranForo, statusLaporan: statusLaporan, colorStatus: colorStatus, arrayTrack: tracks)
                }
            }
            
            ZStack {
                Color.white.frame(height: 8)
                HStack {
                    Spacer().frame(width: UIScreen.main.bounds.width * 0.093)
                    Circle().foregroundColor(.blue).frame(width: 5,height: 5)
                    Spacer()
                }
            }
        }
    }
}

struct LaporanView_Previews: PreviewProvider {
    static var previews: some View {
        LaporanView()
    }
}
