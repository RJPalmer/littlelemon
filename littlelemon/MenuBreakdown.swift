//
//  MenuBreakdown.swift
//  littlelemon
//
//  Created by Robert Palmer on 7/16/23.
//

import SwiftUI

struct MenuBreakdown: View {
    @Binding public var dishCategory:String
    @State var didTap:Bool = false
    var body: some View {
        VStack(alignment: .leading){
            Text("Order for Delivery")
                .font(.subheadline)
            ScrollView(.horizontal){
                HStack{
                    Button(action: {
                    dishCategory = "starters"}, label: {
                    })
                    .buttonStyle(breakdownButtons(labelText: "starters"))
                    Button(action: {
                        dishCategory = "mains"
                    }, label: {
                    }).buttonStyle(breakdownButtons(labelText: "mains"))
                    Button(action: {
                        dishCategory = "a la carte"
                    }, label: {
                        
                    }).buttonStyle(breakdownButtons(labelText: "a la carte"))

                    Button (action: {
                        dishCategory = "desserts"
                    }, label: {
                    }).buttonStyle(breakdownButtons(labelText: "desserts"))
                }
            }

        }
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .frame(maxWidth: .infinity)
    }
}

struct breakdownButtons: ButtonStyle{
    let labelText:String
    func makeBody(configuration: Self.Configuration) -> some View {
        
        
        
        HStack{
            Text(labelText.capitalized)
                .padding(.all)
        }
            .background(!configuration.isPressed ? Color("buttonColor"): Color("backgroundColor"))
            .cornerRadius(10)
            
            
        
    }
    
    
}

struct MenuBreakdown_Previews: PreviewProvider {
    
    @State static var previewBinding:String = ""
    static var previews: some View {
    
    
        MenuBreakdown(dishCategory: $previewBinding)
    }
}
