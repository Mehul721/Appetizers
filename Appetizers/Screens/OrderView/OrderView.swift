 //
//  OrderView.swift
//  Appetizers
//
//  Created by Mehul Jain on 16/07/24.
//

import SwiftUI

struct OrderView: View {
    @State private var orderItem = MockData.orderItems
    var body: some View {
        NavigationView{
            VStack{
                List{
                    ForEach(MockData.orderItems){
                        appetizer in AppetizerListCell(appetizer:appetizer)
                    }
                    .onDelete(perform: deleteItems)
                }.listStyle(InsetListStyle())
                
                Button{
                    print("order placed,")
                }label: {
                    APButtons(title: "$99.99- Place Order")
                }
                .padding(.bottom,25)
            }
            .navigationTitle("Orders")
        }
        }
    func deleteItems(at offesets: IndexSet){
        orderItem.remove(atOffsets:offesets)
    }
}


