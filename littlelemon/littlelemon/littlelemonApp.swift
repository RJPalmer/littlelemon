//
//  littlelemonApp.swift
//  littlelemon
//
//  Created by Robert Palmer on 6/30/23.
//

import SwiftUI

@main
struct littlelemonApp: App {
    var body: some Scene {
        WindowGroup {
            Onboarding(firstName: "", lastName: "", email: "", showAlert: false)
        }
    }
}
