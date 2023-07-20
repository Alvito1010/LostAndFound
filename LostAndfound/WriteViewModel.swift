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
    
    func createPath(texter: String, msg: String){
        ref.child("\(texter)").observeSingleEvent(of: .value){
            snapshot in if snapshot.exists(){
                print("path exists")
            } else {
                self.ref.child("\(texter)").setValue(msg)
            }
        }
        
    }
    
    
}

