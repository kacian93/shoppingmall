//
//  MainTabView.swift
//  DeliveryApp
//
//  Created by PC156 on 2022/09/09.
//

import SwiftUI

struct MainTabView: View {
    
    @State private var selectTab : Tabs = .home
    
    private enum Tabs{
        case home, recipe, gallery, myPage
    }
    
    
    var body: some View {
        TabView(selection: $selectTab, content: {
            home
            recipe
            imagegallery
            myPage
        }).edgesIgnoringSafeArea(.top)
    }
    
    var home : some View {
        HomeView()
            .tag(Tabs.home)
            .tabItem(image: "house", text: "home")
    }
    
    var recipe : some View{
        Text("recipe")
            .tag(Tabs.recipe)
            .tabItem(image: "book", text: "recipe")
    }
    var imagegallery : some View{
        Text("image gallery")
            .tag(Tabs.gallery)
            .tabItem(image: "photo.on.rectangle", text: "gallery")
    }
    var myPage : some View{
        Text("my page")
            .tag(Tabs.myPage)
            .tabItem(image: "person", text: "my page")
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}

fileprivate extension View{
    func tabItem(image:String, text:String) -> some View {
        self.tabItem{
            Symbol(image, scale: .large)
                .font(Font.system(size: 17, weight: .light))
            Text(text)
        }
    }
}
