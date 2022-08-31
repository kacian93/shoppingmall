//
//  Order.swift
//  DeliveryApp
//
//  Created by PC156 on 2022/08/30.
//

import Foundation

struct Order : Identifiable {

    static var orderSequence = sequence(first: 1){$0+1}
    let id :Int
    let product : ProductModel
    let quantity : Int
    var price : Int{
        return product.price * quantity
    }
}
