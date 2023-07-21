//
//  WriteViewModel.swift
//  firebaseTest
//
//  Created by Alvito . on 04/05/23.
//

import Foundation
import FirebaseDatabase
import FirebaseDatabaseSwift

class WriteViewModel: ObservableObject{
    
    private let ref = Database.database().reference()
    
    func pushNewValue(username: String, steps: String) {
        ref.child("\(username)").setValue(steps)
    }
    
    func createPath(nama: String, hp: String, jenis: String, rutePerjalanan: String, deskripsi: String, detailLokasi: String, waktu: String) {
        var i = 0
        
        //time function
        
        func getCurrentTime() -> String {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "HH:mm"
                return dateFormatter.string(from: Date())
            }
        
        func getCurrentDate() -> String {
                let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "MMMM d"
                    return dateFormatter.string(from: Date())
            }
        
        // Define a function to recursively check for the next available node
        func checkNextNode() {
            ref.child("\(i)").observeSingleEvent(of: .value) { snapshot in
                if snapshot.exists() {
                    // Node with the current number exists, try the next one
                    i += 1
                    checkNextNode() // Recursive call to check the next number
                } else {
                    // Node with the current number does not exist, create the node
                    let newNodeRef = self.ref.child("\(i)/laporan")
                    newNodeRef.child("nama").setValue(nama)
                    newNodeRef.child("hp").setValue(hp)
                    newNodeRef.child("jenis").setValue(jenis)
                    newNodeRef.child("rutePerjalanan").setValue(rutePerjalanan)
                    newNodeRef.child("deskripsi").setValue(deskripsi)
                    newNodeRef.child("detailLokasi").setValue(detailLokasi)
                    newNodeRef.child("waktu").setValue(waktu)
                    
                    let status1NodeRef = self.ref.child("\(i)/laporanDibuat")
                    status1NodeRef.child("waktu").setValue("\(getCurrentTime())")
                    status1NodeRef.child("tanggal").setValue("\(getCurrentDate())")
                    status1NodeRef.child("bool").setValue(true)
                    
                    let status2NodeRef = self.ref.child("\(i)/laporanDiterima")
                    status2NodeRef.child("waktu").setValue("")
                    status2NodeRef.child("tanggal").setValue("")
                    status2NodeRef.child("bool").setValue(false)
                    
                    let status3NodeRef = self.ref.child("\(i)/prosesPencarian")
                    status3NodeRef.child("waktu").setValue("")
                    status3NodeRef.child("tanggal").setValue("")
                    status3NodeRef.child("bool").setValue(false)
                    
                    let status4NodeRef = self.ref.child("\(i)/pencarianTahapDua")
                    status4NodeRef.child("waktu").setValue("")
                    status4NodeRef.child("tanggal").setValue("")
                    status4NodeRef.child("bool").setValue(false)
                    
                    let status5NodeRef = self.ref.child("\(i)/barangTelahDitemukan")
                    status5NodeRef.child("waktu").setValue("")
                    status5NodeRef.child("tanggal").setValue("")
                    status5NodeRef.child("bool").setValue(false)
                    
                    let status6NodeRef = self.ref.child("\(i)/barangTelahDiambil")
                    status6NodeRef.child("waktu").setValue("")
                    status6NodeRef.child("tanggal").setValue("")
                    status6NodeRef.child("bool").setValue(false)
                    
                    let status7NodeRef = self.ref.child("\(i)/barangTidakDitemukan")
                    status7NodeRef.child("waktu").setValue("")
                    status7NodeRef.child("tanggal").setValue("")
                    status7NodeRef.child("bool").setValue(false)
                }
            }
        }
        
        // Start checking for the first available node
        checkNextNode()
    }


    
    
}

