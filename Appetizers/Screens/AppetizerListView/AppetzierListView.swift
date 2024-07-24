//
//  AppetzierListView.swift
//  Appetizers
//
//  Created by Mehul Jain on 16/07/24.
//

import SwiftUI

struct AppetzierListView: View {
    @StateObject var viewModel = AppetizerListViewModel()
    @State private var appetizers:[Appetizer]=[]
    
    var body: some View {
        ZStack{
            NavigationView{
                List(viewModel.appetizers){
                    appetizer in
                    AppetizerListCell(appetizer:appetizer)
                }
                .navigationTitle("Appetizers")
            }
            .onAppear{
                viewModel.getAppetizers()
            }
            if viewModel.isLoading{
                LoadingView()
            }
        }
        .alert(item:$viewModel.alertItem) {
            alertItem in Alert(
                title:alertItem.title,
                message: alertItem.message,
                dismissButton: alertItem.dismissButton)
        }
    }
}



