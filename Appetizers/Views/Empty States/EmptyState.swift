//
//  EmptyState.swift
//  Appetizers
//
//  Created by Mehul Jain on 01/08/24.
//

import SwiftUI

struct EmptyState: View {
    let imageName: String
    let message: String

    var body: some View {
        ZStack {
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)

            VStack {
                Image(systemName: imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)

                Text(message)
                    .font(.headline)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding()
            }
            .offset(y: -100)
        }
    }
}
