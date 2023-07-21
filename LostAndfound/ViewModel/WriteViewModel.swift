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
        
        // Define a function to recursively check for the next available node
        func checkNextNode() {
            ref.child("\(i)").observeSingleEvent(of: .value) { snapshot in
                if snapshot.exists() {
                    // Node with the current number exists, try the next one
                    i += 1
                    checkNextNode() // Recursive call to check the next number
                } else {
                    // Node with the current number does not exist, create the node
                    let newNodeRef = self.ref.child("\(i)")
                    newNodeRef.child("nama").setValue(nama)
                    newNodeRef.child("hp").setValue(hp)
                    newNodeRef.child("jenis").setValue(jenis)
                    newNodeRef.child("rutePerjalanan").setValue(rutePerjalanan)
                    newNodeRef.child("deskripsi").setValue(deskripsi)
                    newNodeRef.child("detailLokasi").setValue(detailLokasi)
                    newNodeRef.child("waktu").setValue(waktu)
                }
            }
        }
        
        // Start checking for the first available node
        checkNextNode()
    }


    
    
}

