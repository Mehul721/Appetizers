//
//  AppetizerListCell.swift
//  Appetizers
//
//  Created by Mehul Jain on 18/07/24.
//

import SwiftUI

struct AppetizerListCell: View {
    let appetizer:Appetizer
    var body: some View {
        HStack{
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 80, alignment: Alignment(horizontal: .center, vertical: .center))
                .clipShape(RoundedRectangle(cornerRadius: 18))
            VStack(alignment:.leading,spacing:5){
                Text(appetizer.name)
                    .font(.title3)
                    .fontWeight(.medium)
                Text("$\(appetizer.price,specifier:"%.2f")")
                    .foregroundStyle(.black)
                
            }
            .padding()
        }
    }
}

#Preview {
    AppetizerListCell(appetizer: MockData.sampleAppetizers)
}
