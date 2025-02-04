//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Mehul Jain on 24/07/24.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    @EnvironmentObject var order: Order
    let appetizer: Appetizer
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        VStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 225)
            
            VStack(spacing:5) {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                HStack(spacing:40){
                    NutritionInfo(title: "Calories", value: appetizer.carbs)
                    NutritionInfo(title: "Carbs", value: appetizer.carbs)
                    NutritionInfo(title: "Protein", value: appetizer.protein)
                }
            }
            Spacer()
            
            Button {
                order.items.append(appetizer)
                isShowingDetail = false
            } label: {
                //APButtons(title: "$\(appetizer.price,specifier: "%.2f") - Add to Order")
                Text("$\(appetizer.price,specifier: "%.2f") - Add to Order")
            }
            .modifier(StandardButtonStyle())
            //.buttonStyle(.bordered)
            //.tint(.branddPrimary)
            //.controlSize(.large)
            .padding(.bottom, 30)
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(
            Button(action: {
                isShowingDetail = false
            }) {
                XDismissButton()
            },alignment: .topTrailing)
    }
}
#Preview {
    AppetizerDetailView(appetizer: MockData.sampleAppetizers, isShowingDetail: .constant(true))
}

struct NutritionInfo : View {
    
    let title : String
    let value : Int
    var body: some View {
        VStack(spacing: 5){
            Text(title)
                .bold()
                .font(.caption)
            
            Text("\(value)")
                .foregroundStyle(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}
