//
//  DeliveryAppApp.swift
//  DeliveryApp
//
//  Created by PC156 on 2022/08/29.
//

import SwiftUI

@main
struct DeliveryAppApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(Store())
        }
    }
}
