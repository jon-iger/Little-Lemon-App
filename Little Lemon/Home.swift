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
        TabView {
            Menu()
                .environment(\.managedObjectContext, persistence.container.viewContext)
                .tabItem { Label("Menu", systemImage: "list.dash") }
            UserProfile().tabItem { Label("Profile", systemImage: "square.and.pencil") }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    Home()
}
