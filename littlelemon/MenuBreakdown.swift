//
//  MenuBreakdown.swift
//  littlelemon
//
//  Created by Robert Palmer on 7/16/23.
//

import SwiftUI

struct MenuBreakdown: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Order for Delivery")
                .font(.subheadline)
            ScrollView(.horizontal){
                HStack{
                    Button("Lunch") {
                    }
                    Button("Main"){}
                    Button("Desserts"){}
                    Button("A la Carte"){}
                    Button("Starters"){}
                }
            }
            .buttonStyle(.bordered)
        }
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .frame(maxWidth: .infinity)
    }
}

struct MenuBreakdown_Previews: PreviewProvider {
    static var previews: some View {
        MenuBreakdown()
    }
}
