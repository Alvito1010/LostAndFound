//
//  ReadViewModel.swift
//  firebaseTest
//
//  Created by Alvito . on 05/05/23.
//

import Foundation
import FirebaseDatabase
import FirebaseDatabaseSwift

class ReadViewModel: ObservableObject {
    var ref = Database.database().reference()
    @Published var status1Tanggal: String? = nil
    @Published var status2Tanggal: String? = nil
    @Published var status3Tanggal: String? = nil
    @Published var status4Tanggal: String? = nil
    @Published var status5Tanggal: String? = nil
    @Published var status6Tanggal: String? = nil
    @Published var status7Tanggal: String? = nil
    
    @Published var status1Waktu: String? = nil
    @Published var status2Waktu: String? = nil
    @Published var status3Waktu: String? = nil
    @Published var status4Waktu: String? = nil
    @Published var status5Waktu: String? = nil
    @Published var status6Waktu: String? = nil
    @Published var status7Waktu: String? = nil
    
    @Published var status1Bool: Bool? = nil
    @Published var status2Bool: Bool? = nil
    @Published var status3Bool: Bool? = nil
    @Published var status4Bool: Bool? = nil
    @Published var status5Bool: Bool? = nil
    @Published var status6Bool: Bool? = nil
    @Published var status7Bool: Bool? = nil
    
    @Published var status5Deadline: String? = nil
    
    @Published var nama: String? = nil
    @Published var noHp: String? = nil
    @Published var jenisBarang: String? = nil
    @Published var rutePerjalanan: String? = nil
    @Published var deskripsiBarang: String? = nil
    @Published var waktu: String? = nil
    @Published var detailLokasi: String? = nil
    
    @Published var lokasiBarang: String? = nil
    @Published var laporanBatal: Bool? = nil
    
    
//    func readValue() {
//        ref.child("path").observeSingleEvent(of: .value) { snapshot in
//            self.value = snapshot.value as? Int ?? 3
//        }
//        print("read is running")
//    }
    
    func observeStatus(laporanId: Int) {
        
        //tanggal
        ref.child("\(laporanId)/laporanDibuat/tanggal").observe(.value) { snapshot in
            self.status1Tanggal = snapshot.value as? String
        }
        ref.child("\(laporanId)/laporanDiterima/tanggal").observe(.value) { snapshot in
            self.status2Tanggal = snapshot.value as? String
        }
        ref.child("\(laporanId)/prosesPencarian/tanggal").observe(.value) { snapshot in
            self.status3Tanggal = snapshot.value as? String
        }
        ref.child("\(laporanId)/pencarianTahapDua/tanggal").observe(.value) { snapshot in
            self.status4Tanggal = snapshot.value as? String
        }
        ref.child("\(laporanId)/barangTelahDitemukan/tanggal").observe(.value) { snapshot in
            self.status5Tanggal = snapshot.value as? String
        }
        ref.child("\(laporanId)/barangTelahDiambil/tanggal").observe(.value) { snapshot in
            self.status6Tanggal = snapshot.value as? String
        }
        ref.child("\(laporanId)/barangTidakDitemukan/tanggal").observe(.value) { snapshot in
            self.status7Tanggal = snapshot.value as? String
        }
        
        //waktu
        ref.child("\(laporanId)/laporanDibuat/waktu").observe(.value) { snapshot in
            self.status1Waktu = snapshot.value as? String
        }
        ref.child("\(laporanId)/laporanDiterima/waktu").observe(.value) { snapshot in
            self.status2Waktu = snapshot.value as? String
        }
        ref.child("\(laporanId)/prosesPencarian/waktu").observe(.value) { snapshot in
            self.status3Waktu = snapshot.value as? String
        }
        ref.child("\(laporanId)/pencarianTahapDua/waktu").observe(.value) { snapshot in
            self.status4Waktu = snapshot.value as? String
        }
        ref.child("\(laporanId)/barangTelahDitemukan/waktu").observe(.value) { snapshot in
            self.status5Waktu = snapshot.value as? String
        }
        ref.child("\(laporanId)/barangTelahDiambil/waktu").observe(.value) { snapshot in
            self.status6Waktu = snapshot.value as? String
        }
        ref.child("\(laporanId)/barangTidakDitemukan/waktu").observe(.value) { snapshot in
            self.status7Waktu = snapshot.value as? String
        }
        
        //bool
        ref.child("\(laporanId)/laporanDibuat/bool").observe(.value) { snapshot in
            self.status1Bool = snapshot.value as? Bool
        }
        ref.child("\(laporanId)/laporanDiterima/bool").observe(.value) { snapshot in
            self.status2Bool = snapshot.value as? Bool
        }
        ref.child("\(laporanId)/prosesPencarian/bool").observe(.value) { snapshot in
            self.status3Bool = snapshot.value as? Bool
        }
        ref.child("\(laporanId)/pencarianTahapDua/bool").observe(.value) { snapshot in
            self.status4Bool = snapshot.value as? Bool
        }
        ref.child("\(laporanId)/barangTelahDitemukan/bool").observe(.value) { snapshot in
            self.status5Bool = snapshot.value as? Bool
        }
        ref.child("\(laporanId)/barangTelahDiambil/bool").observe(.value) { snapshot in
            self.status6Bool = snapshot.value as? Bool
        }
        ref.child("\(laporanId)/barangTidakDitemukan/bool").observe(.value) { snapshot in
            self.status7Bool = snapshot.value as? Bool
        }
        
        //deadline
        ref.child("\(laporanId)/barangTelahDitemukan/deadline").observe(.value) { snapshot in
            self.status5Deadline = snapshot.value as? String
            
        }
        
        //laporan
        ref.child("\(laporanId)/laporan/nama").observe(.value) { snapshot in
            self.nama = snapshot.value as? String
        }
        ref.child("\(laporanId)/laporan/hp").observe(.value) { snapshot in
            self.noHp = snapshot.value as? String
        }
        ref.child("\(laporanId)/laporan/jenis").observe(.value) { snapshot in
            self.jenisBarang = snapshot.value as? String
        }
        ref.child("\(laporanId)/laporan/rutePerjalanan").observe(.value) { snapshot in
            self.rutePerjalanan = snapshot.value as? String
        }
        ref.child("\(laporanId)/laporan/deskripsi").observe(.value) { snapshot in
            self.deskripsiBarang = snapshot.value as? String
        }
        ref.child("\(laporanId)/laporan/waktu").observe(.value) { snapshot in
            self.waktu = snapshot.value as? String
        }
        ref.child("\(laporanId)/laporan/detailLokasi").observe(.value) { snapshot in
            self.detailLokasi = snapshot.value as? String
        }
        ref.child("\(laporanId)/laporan/lokasiBarang").observe(.value) { snapshot in
            self.lokasiBarang = snapshot.value as? String
        }
        ref.child("\(laporanId)/laporan/laporanBatal").observe(.value) { snapshot in
            self.laporanBatal = snapshot.value as? Bool
        }
        
    }
    
//    func observeTileChange(columnIndex: Int, rowIndex: Int, otp: String){
//        ref.child("\(otp)/\(columnIndex)\(rowIndex)").observe(.value) { snapshot in
//            self.value = snapshot.value as? Int ?? 3
//        }
//    }
    
}
