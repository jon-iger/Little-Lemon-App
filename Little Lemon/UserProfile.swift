//
//  UserProfile.swift
//  Little Lemon
//
//  Created by Jon Iger on 8/30/24.
//

import SwiftUI

struct UserProfile: View {
    
    let firstName = UserDefaults.standard.value(forKey: kFirstName)
    let lastName = UserDefaults.standard.value(forKey: kLastName)
    let email = UserDefaults.standard.value(forKey: kEmail)
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack{
            Text("Personal Information")
            Image("profile-image-placeholder")
            if let firstName = firstName as? String {
                Text(firstName)
            }
            if let lastName = lastName as? String {
                Text(lastName)
            }
            if let email = email as? String {
                Text(email)
            }
            Button("Logout") {
                UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                self.presentation.wrappedValue.dismiss()
            }
            Spacer()
        }
    }
}

#Preview {
    UserProfile()
}
