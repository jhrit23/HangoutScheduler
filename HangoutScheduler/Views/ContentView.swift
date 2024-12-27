//
//  ContentView.swift
//  HangoutScheduler
//
//  Created by Jonathan Hesler on 12/17/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ContentViewViewModel()
    
    var body: some View {
        VStack {
            if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
                //Add a view here
            }else{
                LoginView()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
