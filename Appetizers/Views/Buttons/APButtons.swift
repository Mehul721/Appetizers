//
//  APButtons.swift
//  Appetizers
//
//  Created by Mehul Jain on 26/07/24.
//

import SwiftUI

struct APButtons: View {
    
    let title: LocalizedStringKey
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width:260,height:50)
            .foregroundStyle(.white)
            .background(Color.brandPrimary)
            .clipShape(.capsule)
    }
}

#Preview {
    APButtons(title: "Test title")
}
