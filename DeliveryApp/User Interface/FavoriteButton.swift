//
//  FavoriteButton.swift
//  DeliveryApp
//
//  Created by PC156 on 2022/08/30.
//

import SwiftUI


struct FavoriteButton : View {
    @EnvironmentObject var store: Store
    var product: ProductModel
    
    private var imageName : String{
        product.isFavorite ? "heart.fill": "heart"
    }
    
    var body: some View {
            Image(systemName: imageName)
                .imageScale(.large)
                .foregroundColor(.heart)
                .frame(width: 32, height: 32)
                .onTapGesture {
                    store.toggleFavorite(self.product)
                }

    }
}


//struct FavoriteButton_Previews: PreviewProvider {
//    static var previews: some View {
//        FavoriteButton()
//    }
//}
