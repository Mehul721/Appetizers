 //
//  ContentView.swift
//  Appetizers
//
//  Created by Mehul Jain on 16/07/24.
//

import SwiftUI

struct AppetizerTabView: View {
    var body: some View {
        TabView{
            AppetzierListView()
            .tabItem {
                    Image(systemName :"house")
                    Text("Home")
                }
            .badge(2)
            AccountView()
            .tabItem {
                    Image(systemName :"person.crop.circle")
                    Text("Account")
                }
            .badge("!")
            OrderView()
            .tabItem {
                    Image(systemName :"bag")
                    Text("Order")
            }
        }
        .tint(.branddPrimary)
    }
}
#Preview {
    AppetizerTabView()
}
