//
//  Home.swift
//  Little Lemon
//
//  Created by Jon Iger on 8/30/24.
//

import SwiftUI
import CoreData

struct Home: View {
    
    var persistence: PersistenceController = PersistenceController.shared
    
    var body: some View {
            ZStack {
                Color.white.edgesIgnoringSafeArea(.all)
                TabView {
                    Menu()
                        .environment(\.managedObjectContext, persistence.container.viewContext)
                        .tabItem { Label("Menu", systemImage: "list.dash") }
                    UserProfile().tabItem { Label("Profile", systemImage: "square.and.pencil") }
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
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    Home()
}
