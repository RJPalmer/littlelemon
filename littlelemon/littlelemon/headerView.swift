//
//  headerView.swift
//  littlelemon
//
//  Created by Robert Palmer on 7/16/23.
//

import SwiftUI

struct headerView: View {
    var body: some View {
        HStack(alignment: .center, spacing: 5.0 ){
            HStack {
                Rectangle()
                    .frame(width: 25, height: 25, alignment: .leading)
                    .foregroundColor(.yellow)
                
                Text("Little Lemon")
                    .font(.title)
                    .fontDesign(Font.Design.serif)
                    .multilineTextAlignment(.center)
            }
            .frame(maxWidth: .infinity)
           Spacer()
            Circle()
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .frame(width: /*@START_MENU_TOKEN@*/75.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/75.0/*@END_MENU_TOKEN@*/, alignment: .top)
                .foregroundColor(Color.gray)
        }
        .padding(.leading)
        .frame(maxWidth: .infinity)
        
    }
}

struct headerView_Previews: PreviewProvider {
    static var previews: some View {
        headerView()
    }
}
