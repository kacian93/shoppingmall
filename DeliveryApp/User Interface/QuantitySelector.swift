//
//  QuantitySelector.swift
//  SignupFormUI
//
//  Created by PC156 on 2022/08/30.
//

import SwiftUI

struct QuantitySelector: View {
    @Binding var quantity : Int
    var range : ClosedRange<Int> = 1...20
    let softFeedback  = UIImpactFeedbackGenerator(style: .soft)
    let rigidFeedback = UIImpactFeedbackGenerator(style: .rigid)
    
    var body: some View {
        HStack{
            Button{
                changeQuantity(-1)
            }label: {
                Image(systemName: "minus.circle.fill")
                    .imageScale(.large)
                    .padding()
            }
            Text("\(quantity)")
                .bold()
                .font(Font.system(.title, design: .monospaced))
                .frame(width: 40, height: 60)
            
            Button{
                changeQuantity(1)
            }label: {
                Image(systemName: "plus.circle.fill")
                    .imageScale(.large)
                    .padding()
            }
        }
    }
    
    private func changeQuantity(_ num: Int){
        if range ~= quantity + num{
            quantity += num
            softFeedback.prepare()
            softFeedback.impactOccurred(intensity: 0.8)
        }else{
            rigidFeedback.prepare()
            rigidFeedback.impactOccurred()
        }
    }
}

struct QuantitySelector_Previews: PreviewProvider {
    static var previews: some View {
        QuantitySelector(quantity: .constant(30))
    }
}

