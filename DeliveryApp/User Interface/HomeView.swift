//
//  ContentView.swift
//  DeliveryApp
//
//  Created by PC156 on 2022/08/29.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var store : Store
    
    var body: some View {
        NavigationView {
            List(store.products, id:\.name){ product in
                NavigationLink(destination: ProductDetailView(product: product), label: {
                ProductView(product: product)
                })
            }
        }
        .navigationTitle("Amazon")
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(Store())
    }
}
