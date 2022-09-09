//
//  FavoriteProductScrollView.swift
//  DeliveryApp
//
//  Created by PC156 on 2022/09/02.
//

import SwiftUI

struct FavoriteProductScrollView: View {
    @EnvironmentObject private var store : Store
    @Binding var showingImage: Bool
    
    var body: some View {
        VStack{
            title
            if showingImage{
                products
            }
        }.padding()
    }
    
    
    var title : some View{
        HStack(alignment: .top, spacing: 5){
            Text("お気に入り商品")
                .font(.headline).fontWeight(.bold)
            
            Symbol("arrowtriangle.up.square")
                .padding()
                .rotationEffect(Angle(radians: showingImage ? .pi : 0))
            Spacer()
        }
        .padding(.bottom, 8)
        .onTapGesture {
            self.showingImage.toggle()
        }
    }
    
    var products : some View{
        let favoriteproducts = store.products.filter{$0.isFavorite}
        return ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing:0){
                ForEach(favoriteproducts) {product in
                    NavigationLink(destination: ProductDetailView(product: product), label: {
                        self.eachProduct(product)
                    })
                }
            }
        }
    }
    
    func eachProduct(_ product : ProductModel) -> some View {
        GeometryReader{geo in
            ResizedImage(product.imageName , renderingMode : .original)
                .clipShape(Circle())
                .frame(width: 90, height: 90)
                .scaleEffect(self.scaledValue(from: geo))
            
        }
        .frame(width: 105, height: 105)
    }
    
    func scaledValue(from geometry : GeometryProxy) -> CGFloat {
        let xOffset = geometry.frame(in: .global).minX - 16
        let minSize : CGFloat = 0.9
        let maxSize : CGFloat = 1.1
        let delta : CGFloat = maxSize - minSize
        let size = minSize + delta * (1 - xOffset / UIScreen.main.bounds.width)
        return max(min(size, maxSize), minSize)
    }
}
