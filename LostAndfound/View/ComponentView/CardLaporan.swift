//
//  ComponentCardLaporan.swift
//  LostAndfound
//
//  Created by Bayu Alif Farisqi on 21/07/23.
//

import SwiftUI

struct CardLaporan: View {
    var noLaporan: String
    var nama: String
    var noHp: String
    var jenisBarang: String
    var rutePerjalanan: String
    var tanggalKehilangan: Date
    var deskripsiBarang: String
    var detailLokasi: String
    var detailWaktu: String
    var lampiranForo: String
    var statusLaporan: String
    var colorStatus: String
    var arrayTrack: [ComponentTrack]
    
    var body: some View {
        VStack{
            VStack(spacing:10){
                HStack{
                    Text("Nomor Laporan: \(noLaporan)")
                        .foregroundColor(.accentColor)
                        .fontWeight(.semibold)
                        .font(.system(size: 16))
                    Spacer()
                }
                VStack(spacing:4){
                    HStack{
                        Text("Jenis Barang")
                            .font(.system(size: 14))
                            .fontWeight(.semibold)
                        Spacer()
                    }
                    HStack{
                        Text("\(jenisBarang)")
                            .font(.system(size: 13))
                        Text("Lihat Selengkapnya")
                            .font(.system(size: 13))
                            .foregroundColor(.gray)
                        
                        Spacer()
                    }
                }
                Rectangle()
                    .frame(width: .infinity, height: 2)
                    .foregroundColor(.gray.opacity(0.2))
                NavigationLink(destination: SubCardView(arrayTrack: arrayTrack)) {
                    HStack{
                        Text("Status :")
                            .font(.system(size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                        Text("\(statusLaporan)")
                            .font(.system(size: 14))
                            .foregroundColor(colorStatus == "green" ? .green : .red)
                            .lineLimit(1)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .font(.system(size: 14))
                            .foregroundColor(colorStatus == "green" ? .green : .red)
                    }
                }
                
                
            }.padding().background(.white).cornerRadius(12)
            Spacer()
        }.padding()
    }
}

//struct ComponentCardLaporan_Previews: PreviewProvider {
//    static var previews: some View {
//        CardLaporan(arrayTrack: [])
//    }
//}
