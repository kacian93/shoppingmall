//
//  ResizedImage.swift
//  DeliveryApp
//
//  Created by PC156 on 2022/09/09.
//

import SwiftUI

struct ResizedImage: View {
    
    let imageName : String
    let contentMode : ContentMode
    let renderingMode : Image.TemplateRenderingMode?
    
    init(
        _ imageName : String,
        contentMode : ContentMode = ContentMode.fill,
        renderingMode : Image.TemplateRenderingMode? = nil
    ){
        self.imageName = imageName
        self.contentMode = contentMode
        self.renderingMode = renderingMode
    }
    
    var body: some View {
        Image(imageName)
            .renderingMode(renderingMode)
            .resizable()
            .aspectRatio(contentMode: contentMode)
    }
}

