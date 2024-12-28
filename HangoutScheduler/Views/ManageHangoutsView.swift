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
    
    init(uid: String) {
        self._hangouts = FirestoreQuery(collectionPath: "users/\(uid)/hangouts")
    }
    
    var body: some View {
        VStack {
            List(hangouts) { hangout in
                HangoutView(hangout: hangout)
            }
        }
    }
}

#Preview {
    ManageHangoutsView(uid: "")
}
