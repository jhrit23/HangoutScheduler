//
//  NewHangoutView.swift
//  HangoutScheduler
//
//  Created by Jonathan Hesler on 12/27/24.
//

import SwiftUI

struct NewHangoutView: View {
    
    @StateObject var viewModel = NewHangoutViewViewModel()
    @Binding var showView: Bool
    
    var body: some View {
        VStack {
            Text("Create a New Hangout")
                .padding(.top, 10)
            Form {
                TextField("Name", text: $viewModel.name)
                TextField("Location", text: $viewModel.location)
                TextField("Description", text: $viewModel.description)
                Toggle("Pre-Set Date", isOn: $viewModel.dateSelected)
                if (viewModel.dateSelected) {
                    DatePicker("Hangout Time", selection: $viewModel.dateTime)
                        .datePickerStyle(GraphicalDatePickerStyle())
                }
                Button(action: {
                    if viewModel.validHangout() {
                        showView = false
                        viewModel.createHangout()
                    }else{
                        viewModel.showAlert = true
                    }
                }, label: {
                    Text("Create Hangout")
                })
                .buttonStyle(.borderedProminent)
                .frame(maxWidth: .infinity)
                Button(action: {
                    showView = false
                }, label: {
                    Text("Cancel")
                })
                .buttonStyle(.borderedProminent)
                .frame(maxWidth: .infinity)
            }
        }
        .alert(isPresented: $viewModel.showAlert) {
            Alert(title: Text("Error"), message: Text("Please ensure all fields have text and a the date hasn't passed if applicable."))
        }
    }
}

#Preview {
    NewHangoutView(showView: Binding(get: {
        return true
    }, set: {_ in
        
    }))
}
