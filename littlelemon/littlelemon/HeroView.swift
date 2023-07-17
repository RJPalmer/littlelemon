//
//  HeroView.swift
//  littlelemon
//
//  Created by Robert Palmer on 7/16/23.
//

import SwiftUI

struct HeroView: View {
    @State var searchText:String
    var body: some View {
        VStack{
            HStack(alignment: .center){
                VStack(alignment: .leading){
                    Text("Little Lemon")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.yellow)
                        .multilineTextAlignment(.leading)
                    Text("Chicago")
                        .font(.subheadline)
                    HStack(alignment: .center){
                        Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist")
                            .font(.system(size: 14))
                            .multilineTextAlignment(.center)
                        Spacer()
                        Rectangle()
                            .frame(width: 90.0, height: 90.0)
                    }
                    .padding(/*@START_MENU_TOKEN@*/[.top, .bottom, .trailing]/*@END_MENU_TOKEN@*/)
                }
                .frame(
                    maxWidth: .infinity,
                    alignment: .leading)
                
            }
            .padding(/*@START_MENU_TOKEN@*/.all, 5.0/*@END_MENU_TOKEN@*/)
            .frame(maxWidth: .infinity)
            HStack{
                Image(systemName: "magnifyingglass")
                TextField("Search", text: $searchText)
            }
            .background(Color(.secondarySystemBackground))
            .cornerRadius(10)
            .foregroundColor(.secondary)
        }
        .padding([.leading, .bottom, .trailing])
        .background(Color("backgroundColor"))
        .foregroundColor(Color.white)
        
    }
}

struct HeroView_Previews: PreviewProvider {
    static var searchTxt:String = ""
    static var previews: some View {
        HeroView(searchText: searchTxt)
    }
}
