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
        VStack(alignment: .center, spacing: 15.0){
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            VStack {
                Text(menuDish.title ?? "Title")
                HStack(alignment: .top, spacing: 11.0){
                    Text(menuDish.dishDescription ?? "Description")
                        .multilineTextAlignment(.leading)
                        .lineLimit(4)
                    AsyncImage(url: URL(fileURLWithPath: menuDish.image ?? ""), content: {_ in }) {
                        Rectangle()
                            .fill(.black)
                            .frame(width: 100, height: 100)
                    }
                }
                .frame(width: 300.0)
            }
            .scaledToFit()
            
        }
        .padding(.all)
        .scaledToFill()
        
        
    }
}


struct MenuItemDetails_Previews: PreviewProvider {
    static var dishItem:Dish = Dish(context: CoreDataStack.context)

    static var previews: some View {
        
        MenuItemDetails(menuDish: dishItem)
    }
}
