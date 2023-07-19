//
//  UserProfile.swift
//  littlelemon
//
//  Created by Robert Palmer on 7/3/23.
//

import SwiftUI

struct UserProfile: View {
    let firstName:String = UserDefaults.standard.string(forKey: "kFirstName") ?? "Test"
    let lastName:String = UserDefaults.standard.string(forKey: "kLastName") ?? "Person"
    let email:String = UserDefaults.standard.string(forKey: "kEmail"
    ) ?? "test@test.com"
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack(alignment: .center){
            headerView()
            VStack{
                Text(verbatim: "Personal Information")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.yellow/*@END_MENU_TOKEN@*/)
                Image("profile-image-placeholder")
                    .padding(.vertical)
                    
                VStack(spacing: 10){
                    LabeledContent("FirstName") {
                        Text(firstName)
                        Spacer()
                    }
                    
                    LabeledContent("Last Name: "){
                        Text(lastName)
                        Spacer()
                    }
                    LabeledContent("Email: "){
                        Text(email)
                        Spacer()
                    }
                }
                .padding(.all)
                .background(Color.secondary)
                .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
            }
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .background(Color("backgroundColor"))
            .foregroundColor(Color.white)
            .cornerRadius(10)
            Button("Logout") {
                UserDefaults.standard.set(false, forKey: "kIsLoggedIn")
                self.presentation.wrappedValue.dismiss()
            }
            .padding(.top)
            .buttonStyle(.bordered)
            Spacer()
        }
        .padding(.horizontal)
        .frame(maxHeight: .infinity)
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
