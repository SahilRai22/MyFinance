//
//  HomeViewModel.swift
//  MyFinance
//
//  Created by Sahil Rai on 27/05/2024.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    func signOut() throws {
        try AuthenticationManager.shared.logOutUser()
    }
}
