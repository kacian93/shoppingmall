//
//  PopupViewSelf.swift
//  DeliveryApp
//
//  Created by PC156 on 2022/09/02.
//

import SwiftUI

struct PopupView: View {
    @Binding var isPresent: Bool
    @State var product : ProductModel
    @State var quantity: Int = 1
    var body: some View {
        VStack(spacing: 12) {
            Symbol("checkmark.circle.fill",scale: .large, color: .heart)
            Text("\(product.name)の\(quantity)個")
                .font(Font.system(size: 18).bold())
                .foregroundColor(.heart)
            Text("注文完了")
                .font(Font.system(size: 18).bold())
            
            Button(action: {
                withAnimation {
                    isPresent = false
                }
            }, label: {
                Text("Close")
            })
        }
        .frame(width: 280, alignment: .center)
        .padding(32)
        .background(.white)
        .cornerRadius(16)
        .shadow(color: .gray, radius: 10, x: 0, y: -5)

    }
}
