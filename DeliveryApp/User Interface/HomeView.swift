//
//  ContentView.swift
//  DeliveryApp
//
//  Created by PC156 on 2022/08/29.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var store : Store
    @State private var quickOrder : ProductModel?
    @State private var showingFavoriteimage : Bool = true
    
    var body: some View {
        NavigationView {
            VStack{
                if showFavorite{
                    favoriteProducts
                }
                DarkDivider
                ProductList
            }
            .navigationTitle("Amazon")
        }.padding(0)
    }
    
    var favoriteProducts : some View{
        FavoriteProductScrollView(showingImage: $showingFavoriteimage)
            .padding(.top,24)
            .padding(.bottom,8)
    }
    var DarkDivider : some View{
        Color.primary
            .opacity(0.3)
            .frame(maxWidth:.infinity, maxHeight: 1)
    }
    
    var ProductList : some View{
        List(store.products){ product in
            NavigationLink(destination: ProductDetailView(product: product), label: {
                ProductView(product: product)
            })
        }
    }
    
    var showFavorite : Bool{
        !store.products.filter({$0.isFavorite}).isEmpty
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(Store())
    }
}

func popupMessage(product : ProductModel) -> some View{
    //    let name = product.name.split(separator: " ").last
    let name = product.name
    return VStack{
        Text(name)
            .font(.title).bold().kerning(3)
            .foregroundColor(.heart)
            .padding()
        OrderCompleteMessage()
    }
}

