//
//  Onboarding.swift
//  littlelemon
//
//  Created by Robert Palmer on 6/30/23.
//

import SwiftUI


struct Onboarding: View {
    @State var firstName:String
    @State var lastName:String
    @State var email:String
    
    @State var showAlert:Bool = false
    @State var emailIsValid = false
    @State var isLoggedIn = UserDefaults.standard.bool(forKey: "kIsLoggedIn")

    var body: some View {
        
        NavigationView() {
            VStack{
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                NavigationLink(destination: Home(), isActive: $isLoggedIn){
                    EmptyView()
                }
                Form  {
                    Section(header: Text("User Info"), content: {
                        
                        
                        TextField("First Name", text: $firstName)
                        TextField("Last Name", text: $lastName)
                        TextField("Email", text: $email)
                            .onChange(of: email, perform: { newValue in
                                if(isValidEmail(emailText: newValue)){
                                    emailIsValid = true
                                }
                            })
                            .foregroundColor(emailIsValid ? .blue : .red)
                    })
                    Button("Register") {
                        if(!firstName.isEmpty && !lastName.isEmpty && !email.isEmpty){
                            isLoggedIn = true
                            UserDefaults.standard.set(self.isLoggedIn, forKey: "kIsLoggedIn")
                            UserDefaults.standard.set(self.firstName, forKey: "kFirstName")
                            UserDefaults.standard.set(self.lastName, forKey: "kLastName")
                            UserDefaults.standard.set(self.email, forKey: "kEmail")
                        }
                        else{
                            showAlert = true;
                        }
                        
                    }
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("Missing User Information"),
                              message: Text("Pleace Check All Fields"))
                    }
                    
                }
            }
        }
    }
}
func isValidEmail(emailText:String) -> Bool {
    let emailConditions = /^[\w\-\.]+@([\w\-]+\.)+[\w\-]{2,4}$/
    return emailText.contains(emailConditions.regex)
}
struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding(firstName: "", lastName:"", email: "", showAlert: false, emailIsValid: false)
    }
}
