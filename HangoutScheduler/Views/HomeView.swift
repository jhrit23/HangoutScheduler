//
//  HomeView.swift
//  HangoutScheduler
//
//  Created by Jonathan Hesler on 12/26/24.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink("Create a Hangout", destination: {
                    NewHangoutView()
                })
                .padding()
                NavigationLink("Manage Your Hangouts", destination: {
                    ManageHangoutsView()
                })
                .padding()
                NavigationLink("See Other Hangouts", destination: {
                    OtherHangoutsView()
                })
                .padding()
                Button(action: {
                    viewModel.logout()
                }, label: {
                    Text("Logout")
                })
                .padding()
            }
        }
    }
}

#Preview {
    HomeView()
}