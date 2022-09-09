//
//  Popup.swift
//  DeliveryApp
//
//  Created by PC156 on 2022/08/31.
//

import SwiftUI

struct Popup<Message : View> : ViewModifier {
    let size : CGSize?
    let style : PopupStyle
    let message: Message
    init(size : CGSize? = nil , style : PopupStyle = .none, message : Message){
        self.size = size
        self.style = style
        self.message = message
    }
    private var popupContent : some View {
        GeometryReader{ geo in
            VStack{
                self.message
            }
            .frame(width: self.size?.width ?? geo.size.width * 0.6,
                   height: self.size?.height ?? geo.size.height * 0.25,
                   alignment: .center)
            
            .background(Color.primary.colorInvert())
            .cornerRadius(12)
            .shadow(color: .primary, radius: 15, x: 5, y: 5)
            .overlay(self.checkCircleMark, alignment: .top)
        }
    }
    
    private var checkCircleMark: some View{
        Symbol("checkmark.circle.fill", color: .heart)
            .font(Font.system(size: 60).weight(.semibold))
            .background(Color.white.scaleEffect(0.9))

            .offset(x:0, y:-30)
    }
    
    //MARK: -- method
    func body(content: Content) -> some View {
        content
            .blur(radius: style == .blur ? 2 : 0 )
            .overlay(Rectangle().fill(Color.black.opacity(style == .dimmed ? 0.4 :0)))
            .overlay(popupContent)
    }
    
    
    
}


enum PopupStyle{
    case none, blur, dimmed
}


fileprivate struct PopupToggle : ViewModifier{
    @Binding var isPresented : Bool
    func body(content : Content) -> some View {
        content.disabled(isPresented)
            .onTapGesture {
                self.isPresented.toggle()
            }
    }
}
extension View{
    func popup<Content:View> (
        isPresented : Binding<Bool>,
        size : CGSize? = nil,
        style : PopupStyle = .none,
        @ViewBuilder content : () -> Content
    ) -> some View{
        if isPresented.wrappedValue{
            let popup = Popup(size: size, style: style, message: content())
            let popupToggle = PopupToggle(isPresented: isPresented)
            let modifiedContent = self.modifier(popup).modifier(popupToggle)
            
            return AnyView(modifiedContent)
        }else{
            return AnyView(self)
        }
    }
}
