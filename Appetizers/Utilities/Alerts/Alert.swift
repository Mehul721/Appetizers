//
//  Alert.swift
//  Appetizers
//
//  Created by Mehul Jain on 20/07/24.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidData = AlertItem(
        title: Text("Server Error"),
        message: Text("The data received from the server was invalid. Please contact support."),
        dismissButton: .default(Text("OK"))
    )

    static let invalidResponse = AlertItem(
        title: Text("Server Error"),
        message: Text("Invalid response from the server. Please try again later or contact support."),
        dismissButton: .default(Text("OK"))
    )

    static let invalidURL = AlertItem(
        title: Text("Server Error"),
        message: Text("Issue connecting to the server.Please contact support."),
        dismissButton: .default(Text("OK"))
    )

    static let unableToComplete = AlertItem(
        title: Text("Server Error"),
        message: Text("Unable to complete your request at this time.If this persists, please contact support."),
        dismissButton: .default(Text("OK"))
    )
}
