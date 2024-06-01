//
//  FireStoreManager.swift
//  MyFinance
//
//  Created by Sahil Rai on 01/06/2024.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift


class FireStoreManager {
    static let shared = FireStoreManager()
    let db: Firestore
    
    private init() {
        self.db = Firestore.firestore()
    }
}
