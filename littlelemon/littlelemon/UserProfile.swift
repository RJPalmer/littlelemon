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
        VStack{
            Text(verbatim: "Personal Information")
            Image("profile-image-placeholder")
                .padding(.vertical)
                .frame(width: 100.0, height: 100.0)
            LabeledContent("FirstName") {
                Text(firstName)
            }
            LabeledContent("Last Name: "){
                Text(lastName)
            }
            LabeledContent("Email: "){
                Text(email)
            }
            Button("Logout") {
                UserDefaults.standard.set(false, forKey: "kIsLoggedIn")
                self.presentation.wrappedValue.dismiss()
            }
            .padding(.top)
        }
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
