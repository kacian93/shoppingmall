//
//  ProductDetailView.swift
//  DeliveryApp
//
//  Created by PC156 on 2022/08/29.
//

import SwiftUI

struct ProductDetailView: View {
    @EnvironmentObject var store : Store
    @State private var quantity : Int = 1
    @State private var showingAlert : Bool = false
    @State private var showingPopup : Bool = false
    
    var product : ProductModel
    
    var body: some View {
        ZStack{
            VStack(alignment: .center,spacing:0){
                productImage
                orderView
                
            }
            .edgesIgnoringSafeArea(.top)
            .alert(isPresented: $showingAlert, content: {confirmAlert})
            if showingPopup{
                PopupView(isPresent: $showingPopup,product: product, quantity: quantity)
            }
        }
    }
    
    //MARK: --viewを分けて変数で
    
    var orderView : some View{
        
        let price = quantity * product.price
        
        
        return GeometryReader{ geo in
            VStack(alignment: .leading){
                titleView
                Text(product.description)
                    .foregroundColor(.secondary)
                    .fixedSize()
                Spacer()
                HStack{
                    Text("¥")
                        .font(.footnote)
                    Text("\(price)")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer()
                    QuantitySelector(quantity: $quantity)
                }
                orderButton
            }.frame(height: geo.size.height+20)
                .padding(32)
                .background(.white)
                .cornerRadius(16)
                .shadow(color: .gray, radius: 10, x: 0, y: -5)
        }
    }
    
    var orderButton: some View{
        Button{
            self.showingAlert = true
        }label: {
            Capsule()
                .fill(Color(hue: 1.0, saturation: 1, brightness: 1))
                .frame(maxWidth:.infinity, minHeight: 30, maxHeight: 50)
                .overlay(Text("注文する")
                    .font(.title)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .buttonStyle(ShrinkButtonStyle())
                ).padding(.vertical,8)
            
        }
        .padding(.bottom, 50)
    }
    var productImage : some View{
        GeometryReader{geo in
            Image(product.imageName).resizable().scaledToFill()
        }
    }
    
    
    var titleView : some View {
        HStack{
            Text(product.name)
                .font(.largeTitle)
                .fontWeight(.medium)
                .foregroundColor(.black)
            FavoriteButton(product: product)
        }
    }
    var confirmAlert : Alert{
        Alert(title: Text("注文確認"), message: Text("\(product.name)を\(quantity)個注文しますか"), primaryButton: .default(Text("はい"), action: {
            showingPopup = true
            
        }), secondaryButton: .cancel(Text("キャンセル")))
    }
    
    //MARK: --method
    func placeOrder(product :  ProductModel, quantity : Int) {
        store.placeOrder(product: product, quantity: quantity)
    }
}

////MARK: --Preview
//struct ProductDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductDetailView()
//    }
//}
