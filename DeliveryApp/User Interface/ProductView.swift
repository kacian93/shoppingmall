//
//  ProductView.swift
//  DeliveryApp
//
//  Created by PC156 on 2022/08/29.
//

import SwiftUI

struct ProductView: View {
    let product : ProductModel
    @EnvironmentObject var store : Store
    @State var showingPopup : Bool = false
    
    var body: some View {
        ZStack{
            HStack{
                productImage
                descriptionView
            }
            if showingPopup{
                PopupView(isPresent: $showingPopup , product: product)
                    .onTapGesture {
                        showingPopup = false
                    }
            }
            
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
                .foregroundColor(Color.heart)
                .frame(width: 30)
                .onTapGesture {
                    showingPopup = true
                    
                }
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
    //    func orderProduct(){
    //        quickOrder = product
    //        store.placeOrder(product: product, quantity: 1)
    //
    //    }
}

