//
//  Hero.swift
//  Little Lemon
//
//  Created by Jon Iger on 8/31/24.
//

import SwiftUI

struct Hero: View {
    var body: some View {
        VStack {
            // Little Lemon + City
            Group {
                VStack {
                    HStack {
                        Text("Little Lemon")
                            .font(.largeTitle)
                            .fontDesign(.serif)
                            .foregroundColor(Color(hex: "F4CE14"))
                            .padding(15)
                            .frame(alignment: .leading)
                        Spacer()
                    }
                    HStack {
                        Text("Chicago")
                            .font(.title2)
                            .fontDesign(.serif)
                            .foregroundColor(Color(hex: "F4CE14"))
                            .padding(15)
                            .frame(alignment: .leading)
                        Spacer()
                    }
                }
            }
            // Long description + image
            Group {
                HStack {
                    Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                        .font(.custom("karla", size: 18))
                        .foregroundColor(Color.white)
                        .padding(2)
                        .frame(alignment: .leading)
                    Image("hero")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                }
                .padding()
            }
        }
        .frame(height: 300)
        .background(Color(hex: "495E57"))
    }
}

#Preview {
    Hero()
}
