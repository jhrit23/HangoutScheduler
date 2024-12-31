//
//  HangoutView.swift
//  HangoutScheduler
//
//  Created by Jonathan Hesler on 12/28/24.
//

import SwiftUI

struct HangoutView: View {
    
    let hangout: Hangout
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Name: " + hangout.getName())
                    .font(.body)
                Text("Location: " + hangout.getLocation())
                    .font(.footnote)
                if hangout.getDateTime() == 1 {
                    Text("Date: TBD")
                        .font(.footnote)
                }else{
                    Text("\(Date(timeIntervalSince1970: hangout.getDateTime()).formatted(date: .abbreviated, time: .shortened))")
                        .font(.footnote)
                }
                Text("Hangout Code: " + hangout.getHangoutCode())
                    .font(.footnote)
            }
        }
    }
}

#Preview {
    HangoutView(hangout: Hangout(id: "test id", ownerId: "test owner id", name: "Test Name", location: "Test Location", description: "Test Description", hangoutCode: "TestCode"))
}
