//
//  HomeView.swift
//  MyFinance
//
//  Created by Sahil Rai on 27/05/2024.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewmodel = HomeViewModel()
    
    var body: some View {
        Text("Home View")
        
        Button(action: {
            do {
                try viewmodel.signOut()
            }
            catch {
                debugPrint("Failed to sign out")
            }
        }, label: {
            Text("Log Out")
        })
    }
}

#Preview {
    HomeView()
}
