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
                Hero()
                NavigationLink(destination: Home(), isActive: $isLoggedIn) {
                    EmptyView()
                }
                .onAppear {
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
                .font(.footnote)
                .padding(5)
                .border(Color.gray)
                .padding()
                TextField(text: $lastName) {
                    Text("Last Name")
                }
                .font(.footnote)
                .padding(5)
                .border(Color.gray)
                .padding()
                TextField(text: $email) {
                    Text("Email")
                }
                .font(.footnote)
                .padding(5)
                .border(Color.gray)
                .padding()
                Button("Register") {
                    if !(firstName.isEmpty && lastName.isEmpty && email.isEmpty) {
                        UserDefaults.standard.set(firstName, forKey: kFirstName)
                        UserDefaults.standard.set(lastName, forKey: kLastName)
                        UserDefaults.standard.set(email, forKey: kEmail)
                        UserDefaults.standard.setValue(true, forKey: kIsLoggedIn)
                        isLoggedIn = true
                    }
                }
                .padding(10)
                .fontDesign(.serif)
                .background(Color(hex: "F4CE14"))
                .foregroundColor(Color(hex: "495E57"))
                .border(Color(hex: "495E57"))
                .padding()
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Image("logo")
                    
                }
                ToolbarItem(placement: .automatic) {
                    Image("profile-image-placeholder")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                }
            }
        }
    }
}

#Preview {
    Onboarding()
}
