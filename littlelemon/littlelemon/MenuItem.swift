//
//  MenuItem.swift
//  littlelemon
//
//  Created by Robert Palmer on 7/5/23.
//

import Foundation

struct MenuItem:Decodable {
    internal init(title: String, category: String, image: String, price: String, dishDescription: String) {
        self.title = title
        self.category = category
        self.image = image
        self.price = price
        self.description = dishDescription
    }
    
    let title:String
    let category:String
    let image:String
    let price:String
    let description:String
}
