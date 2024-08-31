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
    
    @State var changeFirstName: String = ""
    @State var changeLastName: String = ""
    @State var changeEmail: String = ""
    
    var body: some View {
        VStack{
            Group {
                HStack {
                    Text("Personal Information")
                        .font(.title)
                        .frame(alignment: .leading)
                        .padding(15)
                    Spacer()
                }
            }
            HStack {
                Image("profile-image-placeholder")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60, alignment: .leading)
                    .padding()
                Button("Change") {
                    print("Change")
                }
                .padding(10)
                .fontDesign(.serif)
                .foregroundColor(Color(hex: "495E57"))
                .border(Color(hex: "495E57"))
                Button("Remove") {
                    print("Remove")
                }
                .padding(10)
                .fontDesign(.serif)
                .foregroundColor(Color(hex: "495E57"))
                .border(Color(hex: "495E57"))
                .padding()
                Spacer()
            }
            TextField("\(firstName ?? "First Name")", text: $changeFirstName)
                .font(.footnote)
                .padding(5)
                .border(Color.gray)
                .padding()
            TextField("\(lastName ?? "Last Name")", text: $changeLastName)
                .font(.footnote)
                .padding(5)
                .border(Color.gray)
                .padding()
            TextField("\(email ?? "Email Address")", text: $changeEmail)
                .font(.footnote)
                .padding(5)
                .border(Color.gray)
                .padding()
            
            // only added to comply with instructions. Chose to swap out these Text objects with TextFields that can edit these values
//            if let firstName = firstName as? String {
//                Text(firstName)
//            }
//            if let lastName = lastName as? String {
//                Text(lastName)
//            }
//            if let email = email as? String {
//                Text(email)
//            }
            
            HStack {
                Button("Discard Changes") {
                    
                }
                .padding(10)
                .fontDesign(.serif)
                .foregroundColor(Color(hex: "495E57"))
                .border(Color(hex: "495E57"))
                .padding()
                Button("Save Changes") {
                    
                }
                .padding(10)
                .fontDesign(.serif)
                .background(Color(hex: "F4CE14"))
                .foregroundColor(Color(hex: "495E57"))
                .border(Color(hex: "495E57"))
                .padding()
            }
            Button("Logout") {
                UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                self.presentation.wrappedValue.dismiss()
            }
            .frame(width: 300, height: 40)
            .fontDesign(.serif)
            .background(Color(hex: "F4CE14"))
            .foregroundColor(Color(hex: "495E57"))
            .border(Color(hex: "495E57"))
            .padding()
            Spacer()
        }
    }
    
    // clear and reset input fields
    func discardChanges() {
        changeFirstName = ""
        changeLastName = ""
        changeEmail = ""
    }
    
    // save changes from input fields
    func saveChanges() {
        if !(changeFirstName.isEmpty || changeLastName.isEmpty || changeEmail.isEmpty) {
            UserDefaults.standard.setValue(changeFirstName, forKey: kFirstName)
            UserDefaults.standard.setValue(changeLastName, forKey: kLastName)
            UserDefaults.standard.setValue(changeEmail, forKey: kEmail)
        }
    }
}

#Preview {
    UserProfile()
}
