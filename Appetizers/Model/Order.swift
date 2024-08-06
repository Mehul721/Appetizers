//
//  Order.swift
//  Appetizers
//
//  Created by Mehul Jain on 03/08/24.
//

import SwiftUI

final class Order: ObservableObject {
    @Published var items: [Appetizer] = []
    
    var totalPrice: Double{
        items.reduce(0){ $0 + $1.price}
    }
    
    func deleteItems(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}

