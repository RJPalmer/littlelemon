//
//  Home.swift
//  littlelemon
//
//  Created by Robert Palmer on 7/3/23.
//

import SwiftUI

struct Home: View {
    var body: some View {
        TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
            Menu().tabItem { Label("Home", systemImage: "list.dash") }.tag(1)
            UserProfile().tabItem {
                Label("Profile", systemImage: "square.and.pencil")
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
