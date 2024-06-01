//
//  Transaction.swift
//  MyFinance
//
//  Created by Sahil Rai on 01/06/2024.
//

import Foundation
import Firebase
import FirebaseCore
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Transaction: Codable, Identifiable {
    @DocumentID var id: String?
    var userID: String
    var date: Date
    var amount: Int
    var description: Int

}

extension MyFinanceApp {
    func fetchTransactionAsync() {
        Task {
            do{
                let documentTransaction = try await FireStoreManager.shared.db.document("transaction").getDocument(as: Transaction.self)
                
            }
            catch{
                debugPrint(error.localizedDescription)
            }
        }
    }
}
