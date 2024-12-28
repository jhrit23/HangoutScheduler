//
//  HomeView.swift
//  HangoutScheduler
//
//  Created by Jonathan Hesler on 12/26/24.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewViewModel()
    let uid: String
    
    var body: some View {
        NavigationView {
            VStack {
                Button(action: {
                    viewModel.showNewHangoutView = true
                }, label: {
                    Text("Create a Hangout")
                })
                .buttonStyle(.borderedProminent)
                .padding()
                NavigationLink("Manage Your Hangouts", destination: {
                    ManageHangoutsView(uid: uid)
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
            .sheet(isPresented: $viewModel.showNewHangoutView, content: {
                NewHangoutView(showView: $viewModel.showNewHangoutView)
            })
        }
    }
}

#Preview {
    HomeView(uid: "")
}
