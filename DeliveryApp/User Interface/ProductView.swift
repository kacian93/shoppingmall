//
//  ProductView.swift
//  DeliveryApp
//
//  Created by PC156 on 2022/08/29.
//

import SwiftUI

struct ProductView: View {
    let product : ProductModel
    
    var body: some View {
        HStack{
            productImage
            descriptionView
        }
    }
    //MARK: -- view分けて変数に
    
    var productImage : some View{
        Image(product.imageName)
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100, alignment: .leading)
    }
    var footerView: some View {
        HStack{
            Text("¥")
                .font(.footnote)
            Text("\(product.price)").font(.headline)
            Spacer()
            FavoriteButton(product: product)
            Image(systemName: "cart")
                .foregroundColor(Color(hue: 1.0, saturation: 0.282, brightness: 0.999))
                .frame(width: 30)
        }
        
    }
    var descriptionView : some View{
        VStack(alignment: .leading, spacing: 0){
            Text(product.name)
                .font(.headline)
                .fontWeight(.medium)
            Text(product.description)
                .font(.footnote)
                .foregroundColor(.secondary)
            Spacer()
            footerView
        }.padding()
    }

}

