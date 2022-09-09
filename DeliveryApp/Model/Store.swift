//
//  Store.swift
//  DeliveryApp
//
//  Created by PC156 on 2022/08/29.
//

import Foundation
import SwiftUI

final class Store : ObservableObject{
    @Published var products : [ProductModel]
    @Published var orders: [Order] = [Order]()
    
    init(filename : String = "ProductData.json") {
        self.products = Bundle.main.decode(filename: filename, as: [ProductModel].self)
    }
    
    func  placeOrder(product: ProductModel, quantity : Int) {
        let nextId = Order.orderSequence.next()!
        let order = Order(id: nextId, product: product, quantity: quantity)
        orders.append(order)
    }
}

extension Store{
    func toggleFavorite(_ product: ProductModel){
       
        guard let index = products.firstIndex(of: product) else {return}
        products[index].isFavorite.toggle()
    }
}
