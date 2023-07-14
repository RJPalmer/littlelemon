//
//  MenuItemDetails.swift
//  littlelemon
//
//  Created by Robert Palmer on 7/10/23.
//

import SwiftUI

struct MenuItemDetails: View {
    @State var menuDish:Dish
    
    var body: some View {
        
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Text(menuDish.title!)
    }
}

struct MenuItemDetails_Previews: PreviewProvider {
    @Environment(\.managedObjectContext) static private var viewContext
    static var previews: some View {
        
        MenuItemDetails(menuDish: Dish(context: viewContext))
    }
}
