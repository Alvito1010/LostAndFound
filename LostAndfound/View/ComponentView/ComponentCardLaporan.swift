//
//  ComponentCardLaporan.swift
//  LostAndfound
//
//  Created by Bayu Alif Farisqi on 21/07/23.
//

import SwiftUI

struct ComponentCardLaporan: View {
    var body: some View {
        VStack{
            VStack(spacing:10){
                HStack{
                    Text("Nomor Laporan: LB140720230408")
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
                        Text("Botol Minum...")
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
                NavigationLink(destination: SubSelesaiView()) {
                    HStack{
                        Text("Status :")
                            .font(.system(size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                        Text("Barang sudah diambil oleh jane ...")
                            .font(.system(size: 14))
                            .foregroundColor(.green)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .font(.system(size: 14))
                            .foregroundColor(.green)
                    }
                }
                
                
            }.padding().background(.white).cornerRadius(12)
            Spacer()
        }
    }
}

struct ComponentCardLaporan_Previews: PreviewProvider {
    static var previews: some View {
        ComponentCardLaporan()
    }
}
