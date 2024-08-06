 //
//  OrderView.swift
//  Appetizers
//
//  Created by Mehul Jain on 16/07/24.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order 
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(order.items) { appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: order.deleteItems)
                    }
                    .listStyle(InsetListStyle())
                    
                    Button {
                        print("Order placed")
                    } label: {
                        //APButtons(title: "$\(order.totalPrice,specifier:"%.2f")- Place Order")
                        Text("$\(order.totalPrice,specifier:"%.2f")- Place Order")
                    }
                    .modifier(StandardButtonStyle())
                    .padding(.bottom, 25)
                }
                
                if order.items.isEmpty {
                    EmptyState(imageName: "empty-order",
                               message: "You have no items in your order.\nPlease add an appetizer.")
                }
            }
            .navigationTitle("Orders")
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        order.deleteItems(at: offsets)
    }
} 


