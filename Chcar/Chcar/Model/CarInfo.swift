//
//  TodoList.swift
//  Chcar
//
//  Created by HWI on 5/16/24.
//

import Foundation

struct CarInfo: Identifiable{
    var id = UUID() // Unique Identifier
    var image: String
    var brand: String
    var model: String
    var year: Int
    var km: Int
    var price: Int
    
    init(id: UUID = UUID(), image: String, brand: String, model: String, year: Int, km: Int, price: Int) {
        self.id = id
        self.image = image
        self.brand = brand
        self.model = model
        self.year = year
        self.km = km
        self.price = price
    }
}
