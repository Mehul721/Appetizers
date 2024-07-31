//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Mehul Jain on 20/07/24.
//

import SwiftUI

final class AppetizerListViewModel : ObservableObject{
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem : AlertItem?
    @Published var isLoading = false 
    @Published var isShowingDetail = false
    @Published var selectedAppetizer: Appetizer?
    
    func getAppetizers(){
        NetworkManager.shared.getAppetizers{[self] result in
        DispatchQueue.main.async {
            self.isLoading=false
                switch result{
                case .success(let appetizers):
                    self.appetizers = appetizers
                    
                case.failure(let error):
                    switch error{
                        case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse

                        case .invalidURL:
                        self.alertItem = AlertContext.invalidURL

                        case .invalidData:
                        self.alertItem = AlertContext.invalidData

                        case .unabletoComplete:
                        self.alertItem = AlertContext.unableToComplete
                        }
                    }
                }
            }
        }
    }

