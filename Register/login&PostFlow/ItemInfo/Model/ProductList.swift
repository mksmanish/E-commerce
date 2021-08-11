//
//  ProductList.swift
//  Register
//
//  Created by manish on 10/08/21.
//

import Foundation
// MARK: - ProductList
struct ProductList: Decodable {
    let products: [Product]
}

// MARK: - Product
struct Product: Decodable {
    let id: Int
    let name, desc: String
    let price: Int
    let color: String
    let image: String
}
