//
//  Product.swift
//  DeliveryApp
//
//  Created by PC156 on 2022/08/29.
//

import Foundation

struct ProductModel : Decodable,Identifiable {
    let id = UUID()
    let name : String
    let imageName: String
    let price : Int
    let description : String
    var isFavorite : Bool = false
}

extension ProductModel : Equatable{
//    static func == (lhs : ProductModel, rhs: ProductModel) -> Bool{
//        return lhs.id == rhs.id
//    }
}
