//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Mehul Jain on 16/07/24.
//

import SwiftUI

@main
    struct AppetizersApp: App {
        @StateObject private var order = Order()
        var body: some Scene {
            WindowGroup {
                AppetizerTabView().environmentObject(order)
            }
        }
    }

