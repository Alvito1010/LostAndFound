//
//  SubSelesaiView.swift
//  LostAndfound
//
//  Created by Bayu Alif Farisqi on 20/07/23.
//

import SwiftUI
struct SubSelesaiView: View {
    let tracks = [
            ComponentTrack(dateMonth: "16 Jul", time: "18:30", trackingColor: "green", trackingTitle: "Barang Telah Diambil", trackingDescription: "Barang telah diambil oleh Jane Doe di Stasiun Dukuh Atas.", trackingIcon: "checkmark.circle.fill", trackingStatus: false),
            ComponentTrack(dateMonth: "16 Jul", time: "18:30", trackingColor: "", trackingTitle: "Barang Telah Ditemukan", trackingDescription: "Barang telah ditemukan di Stasiun Dukuh Atas. Segera ambil barang sebelum 18 Agustus 2023 di Pusat Informasi Stasiun Dukuh Atas.", trackingIcon: "checkmark.circle.fill", trackingStatus: false),
            
            ComponentTrack(dateMonth: "16 Jul", time: "15:30", trackingColor: "", trackingTitle: "Pencarian Tahap Dua", trackingDescription: "Memasuki proses pencarian di seluruh area stasiun MRT Jakarta.", trackingIcon: "", trackingStatus: false),
            ComponentTrack(dateMonth: "15 Jul", time: "13:30", trackingColor: "", trackingTitle: "Proses Pencarian", trackingDescription: "Memasuki proses pencarian di lokasi sesuai pelaporan.", trackingIcon: "", trackingStatus: false),
            ComponentTrack(dateMonth: "14 Jul", time: "09:30", trackingColor: "", trackingTitle: "Laporan Diterima", trackingDescription: "Laporan telah diterima oleh petugas MRT Jakarta.", trackingIcon: "", trackingStatus: false)
        ]
    init() {
            // Use this to modify the appearance of the NavigationBar
            let appearance = UINavigationBarAppearance()
            appearance.configureWithTransparentBackground()
            appearance.backgroundColor = .white
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().compactAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        }
    var body: some View {
        
//        NavigationView{
            LazyVStack(){
                HStack{
                    Text("Nomor Laporan: LB140720230408")
                        .foregroundColor(.accentColor)
                        .fontWeight(.semibold)
                        .font(.system(size: 16))
                    Spacer()
                }
                .padding()
                .background(.white)
                .cornerRadius(12)
                .padding(.top,16)
                .padding(.bottom,10)
                LazyVStack(spacing: 0){
                    ForEach(tracks, id: \.trackingTitle) { track in
                        ComponentTrack(dateMonth: track.dateMonth, time: track.time, trackingColor: track.trackingColor, trackingTitle: track.trackingTitle, trackingDescription: track.trackingDescription, trackingIcon: track.trackingIcon, trackingStatus: track.trackingStatus)
                    }
                }.padding()
                    .padding(.vertical, 8)
                    .background(.white)
                    .cornerRadius(12)
                
            }
            .padding(.horizontal)

    }
}

struct SubSelesaiView_Previews: PreviewProvider {
    static var previews: some View {
        SubSelesaiView()
    }
}
