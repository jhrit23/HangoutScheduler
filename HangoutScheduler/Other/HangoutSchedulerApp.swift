//
//  HangoutSchedulerApp.swift
//  HangoutScheduler
//
//  Created by Jonathan Hesler on 12/17/24.
//

import FirebaseCore
import SwiftUI

@main
struct HangoutSchedulerApp: App {
    
    init () { FirebaseApp.configure() }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
