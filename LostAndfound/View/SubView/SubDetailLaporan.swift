//
//  SubDetailLaporan.swift
//  LostAndfound
//
//  Created by Bayu Alif Farisqi on 23/07/23.
//

import SwiftUI

struct SubDetailLaporan: View {
    @State private var isShowingAlertBatal = false
    @State var noLaporan: String
    @State var nama: String
    @State var noHp: String
    @State var jenisBarang: String
    @State var rutePerjalanan: String
    @State var tanggalKehilangan: Date
    @State var deskripsiBarang: String
    @State var detailLokasi: String
    @State var detailWaktu: String
    @State var lampiranForo: String
    
    var body: some View {
        ScrollView{
            LazyVStack{
                VStack(alignment: .leading, spacing: 17){
                    //NAMA
                    VStack(alignment: .leading, spacing: 4){
                        Text("Nama Lengkap")
                            .headerStyle()
                        TextField("Nama sesuai KTP", text: $nama)
                            .textFieldStyle(.roundedBorder)
                            .disabled(true)
                    }
                    //NO HP
                    VStack(alignment: .leading, spacing: 4){
                        Text("No Hp")
                            .headerStyle()
                        TextField("No Hp", text: $noHp)
                            .textFieldStyle(.roundedBorder)
                            .disabled(true)
                    }
                    
                    //JENIS BARANG
                    VStack(alignment: .leading, spacing: 4){
                        Text("Jenis Barang")
                            .headerStyle()
                        TextField("Jenis Barang", text: $jenisBarang)
                            .textFieldStyle(.roundedBorder)
                            .disabled(true)
                    }
                    
                    //RUTE PERJALANAN
                    VStack(alignment: .leading, spacing: 4){
                        Text("Rute Perjalanan")
                            .headerStyle()
                        TextField("Rute Perjalanan", text: $rutePerjalanan)
                            .textFieldStyle(.roundedBorder)
                            .disabled(true)
                    }
                    //RUTE PERJALANAN
                    VStack(alignment: .leading, spacing: 4){
                        Text("Deskripsi Barang")
                            .headerStyle()
                        TextField("Rute Perjalanan", text: $deskripsiBarang, axis: .vertical)
                            .textFieldStyle(.roundedBorder)
                            .disabled(true)
                            .lineLimit(5, reservesSpace: true)
                    }
                    //RUTE PERJALANAN
                    VStack(alignment: .leading, spacing: 4){
                        Text("Detail Lokasi")
                            .headerStyle()
                        TextField("Detail Lokasi", text: $detailLokasi)
                            .textFieldStyle(.roundedBorder)
                            .disabled(true)
                    }
                    //RLAMPIRAN FOTO
                    VStack(alignment: .leading, spacing: 4){
                        Text("Lampiran Foto")
                            .headerStyle()
                        Image(systemName: "photo.fill")
                    }
                    HStack{
                        Spacer()
                        Button {
                            isShowingAlertBatal = true
                            //CODE BATALKAN
                            
                        } label: {
                            Text("Batalkan Laporan")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundColor(.red)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.red)
                                )
                        }
                        Spacer()
                    }.padding()
                    
                }
            }
        }
        .padding(.horizontal)
        .padding(.vertical)
        .background(.gray.opacity(0.2))
        .alert(isPresented: $isShowingAlertBatal) {
                    Alert(
                        title: Text("Batalkan Laporan"),
                        message: Text("Apakah Anda yakin ingin membatalkan Laporan dengan No.Laporan  \(noLaporan) ?"),
                        primaryButton: .default(Text("Ya")),
                        secondaryButton: .cancel(Text("Tidak"))
                    )
                }
    }
}

struct SubDetailLaporan_Previews: PreviewProvider {
    static var previews: some View {
        SubDetailLaporan(noLaporan: "lkp08327", nama: "joe taslim", noHp: "087687e", jenisBarang: "elektronik", rutePerjalanan: "Lebak bulus duku atas", tanggalKehilangan: Date(), deskripsiBarang: "earphone hitam samsung", detailLokasi: "stasiun duku atas", detailWaktu: "hari senin", lampiranForo: "String")
    }
}
