//
//  ManageHangoutsView.swift
//  HangoutScheduler
//
//  Created by Jonathan Hesler on 12/27/24.
//

import FirebaseFirestore
import SwiftUI

struct ManageHangoutsView: View {
    
    @FirestoreQuery var hangouts: [Hangout]
    @StateObject var viewModel = ManageHangoutsViewViewModel()
    let uid: String
    
    init(uid: String) {
        self._hangouts = FirestoreQuery(collectionPath: "users/\(uid)/hangouts")
        self.uid = uid
    }
    
    var body: some View {
        VStack {
            List(hangouts) { hangout in
                HangoutView(hangout: hangout)
                    .swipeActions(content: {
                        Button(action: {
                            viewModel.updateSelectedHangout(hangout)
                            viewModel.showEditHangoutView = true
                        }, label: {
                            Text("Edit")
                        })
                    })
            }
        }
        .sheet(isPresented: $viewModel.showEditHangoutView, content: {
//            EditHangoutView()
            VStack {
                Text("Edit Hangout")
                    .padding(.top, 10)
                Text(viewModel.selectedHangout.getHangoutCode())
                Form {
                    HStack {
                        Text("Name:")
                        TextField("", text: $viewModel.selectedHangout.name)
                    }
                    HStack {
                        Text("Location:")
                        TextField("", text: $viewModel.selectedHangout.location)
                    }
                    HStack {
                        Text("Description:")
                        TextField("", text: $viewModel.selectedHangout.description)
                    }
                    Button(action: {
                        viewModel.update()
                        viewModel.showEditHangoutView = false
                    }, label: {
                        Text("Submit")
                    })
                    .buttonStyle(.borderedProminent)
                    .frame(maxWidth: .infinity)
                    Button(action: {
                        viewModel.showEditHangoutView = false
                    }, label: {
                        Text("Cancel")
                    })
                    .buttonStyle(.borderedProminent)
                    .frame(maxWidth: .infinity)
                }
            }
        })
    }
}

#Preview {
    ManageHangoutsView(uid: "")
}
