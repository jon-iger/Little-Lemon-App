//
//  MenuItem.swift
//  Little Lemon
//
//  Created by Jon Iger on 8/30/24.
//

import Foundation

struct MenuItem: Decodable {
    let title: String
    let image: String
    let price: String
    
    init(title: String, image: String, price: String) {
        self.title = title
        self.image = image
        self.price = price
    }
}
