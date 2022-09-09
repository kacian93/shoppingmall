//
//  ShrinkButtonStyle.swift
//  DeliveryApp
//
//  Created by PC156 on 2022/08/31.
//

import SwiftUI

struct ShrinkButtonStyle: ButtonStyle {
    var minScale: CGFloat = 0.9
    var minOpacity : CGFloat = 0.6
    
    func makeBody(configuration : Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? minScale : 1)
            .opacity(configuration.isPressed ? minOpacity : 1)
    }
}

