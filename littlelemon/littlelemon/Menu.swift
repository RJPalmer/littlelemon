//
//  Menu.swift
//  littlelemon
//
//  Created by Robert Palmer on 7/3/23.
//

import SwiftUI

struct Menu: View {
    var body: some View {
        VStack(){
            Text("Little Lemon")
            Text("Chicago")
            Text("Description")
            List {
                EmptyView()
            }
        }
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
