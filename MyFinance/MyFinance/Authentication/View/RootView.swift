//
//  RootView.swift
//  MyFinance
//
//  Created by Sahil Rai on 27/05/2024.
//

import SwiftUI

struct RootView: View {
    @ObservedObject private var authManager = AuthenticationManager.shared
    
    var body: some View {
        if authManager.isLoggedIn {
            HomeView()
        } else {
            LogInView()
        }
    }
}

#Preview {
    RootView()
}
