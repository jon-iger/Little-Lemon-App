//
//  Onboarding.swift
//  Little Lemon
//
//  Created by Jon Iger on 8/30/24.
//

import SwiftUI

var kFirstName: String = "kFirstName"
var kLastName: String = "kLastName"
var kEmail: String = "kEmail"
var kIsLoggedIn: String = "kIsLoggedIn"

struct Onboarding: View {
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @State var isLoggedIn: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: Home(), isActive: $isLoggedIn) {
                    EmptyView()
                }
                .onAppear{
                    let boolValue = UserDefaults.standard.value(forKey: kIsLoggedIn)
                    if let boolValue = boolValue as? Bool {
                        if boolValue {
                            isLoggedIn = true
                        }
                    }
                }
                TextField(text: $firstName) {
                    Text("First Name")
                }
                TextField(text: $lastName) {
                    Text("Last Name")
                }
                TextField(text: $email) {
                    Text("Email")
                }
                Button("Register") {
                    if !(firstName.isEmpty && lastName.isEmpty && email.isEmpty) {
                        UserDefaults.standard.set(firstName, forKey: kFirstName)
                        UserDefaults.standard.set(lastName, forKey: kLastName)
                        UserDefaults.standard.set(email, forKey: kEmail)
                        UserDefaults.standard.setValue(true, forKey: kIsLoggedIn)
                        isLoggedIn = true
                    }
                }
            }
        }
    }
}

#Preview {
    Onboarding()
}
