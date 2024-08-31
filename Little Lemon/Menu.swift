//
//  Menu.swift
//  Little Lemon
//
//  Created by Jon Iger on 8/30/24.
//

import SwiftUI

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State var searchText: String = ""
    var body: some View {
        VStack{
            Spacer()
            Hero()
            Text("Order Here!")
                .font(.title3)
                .padding(3)
            TextField("Search text", text: $searchText)
                .padding(7)
                .border(Color.gray)
                .padding()
            FetchedObjects(predicate: buildPredicate(), sortDescriptors: buildSortDescriptors()) {
                (dishes: [Dish]) in
                List {
                    ForEach(dishes) { dish in
                        HStack {
                            if let title = dish.title {
                                if let price = dish.price {
                                    if let image = dish.image {
                                        Text("Name: \(title) Price: $\(price)")
                                        Spacer()
                                        AsyncImage(url: URL(string: image)) { phase in
                                            switch phase {
                                            case .empty:
                                                ProgressView()
                                                    .frame(width: 90, height: 90)
                                                
                                            case .success(let image):
                                                image
                                                    .resizable()
                                                    .scaledToFill()
                                                    .frame(width: 90, height: 90)
                                                    .clipped()
                                                
                                            case .failure:
                                                Image(systemName: "exclamationmark.triangle.fill")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 90, height: 90)
                                                    .foregroundColor(.red)
                                                
                                            @unknown default:
                                                EmptyView()
                                            }
                                        }
                                        .frame(width: 90, height: 90)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    
        .onAppear{
            getMenuData()
        }
    }
    func getMenuData() {
        PersistenceController.shared.clear()
        let urlString = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
        let urlAddress = URL(string: urlString)!
        let request = URLRequest(url: urlAddress)
        URLSession.shared.dataTask(with: request) {data,status,error in
            let returnedData = data
            if let returnedData = returnedData {
                do {
                    let decoder = JSONDecoder()
                    let newData = try decoder.decode(MenuList.self, from: returnedData)
                    for item in newData.menu {
                        let newDish = Dish(context: viewContext)
                        newDish.title = item.title
                        newDish.image = item.image
                        newDish.price = item.price
                    }
                    try? viewContext.save()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
    
    func buildSortDescriptors() -> [NSSortDescriptor] {
        let descriptor = NSSortDescriptor(key: "title", ascending: true, selector: #selector(NSString.localizedStandardCompare))
        return [descriptor]
    }
    
    func buildPredicate() -> NSPredicate {
        if searchText.isEmpty {
            return NSPredicate(value: true)
        } else {
            return NSPredicate(format: "title CONTAINS [cd] %@", searchText)
        }
    }
}

#Preview {
    Menu()
}
