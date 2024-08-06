//
//  AccountView.swift
//  Appetizers
//
//  Created by Mehul Jain on 16/07/24.
//

import SwiftUI

struct AccountView: View {
    @StateObject private var viewModel = AccountViewModel()
    @FocusState private var focusedTextField : FormTextField?
    enum FormTextField{
        case firstName,lastName,email
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Info")) {
                    TextField("First Name", text: $viewModel.user.firstName)
                        .focused($focusedTextField, equals:.firstName)
                        .onSubmit {
                            focusedTextField = .lastName}
                }
                .submitLabel(.next)
                TextField("Last Name", text: $viewModel.user.lastName)
                    .focused($focusedTextField, equals:.lastName)
                    .onSubmit {
                        focusedTextField = .email}
                    .submitLabel(.next)
                TextField("Email", text: $viewModel.user.email)
                    .focused($focusedTextField, equals:.email )
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .autocorrectionDisabled(true)
                    .onSubmit {
                        focusedTextField = nil}
                    .submitLabel(.continue)
                DatePicker("Birthday", selection: $viewModel.user.birthdate, displayedComponents: .date)
                
                Button {
                    viewModel.saveChanges()
                } label: {
                    Text("Save Changes")
                }
            }
            
            Section(header: Text("Requests")) {
                Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins)
                Toggle("Frequent Refills", isOn: $viewModel.user.frequentRefills)
            }
            .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
        }
        .navigationTitle("Account Details")
        .toolbar{
            ToolbarItemGroup(placement: .keyboard){
                Button("Dismiss"){
                    focusedTextField = nil}
            }
        }
        .onAppear{
            viewModel.retreiveUser()
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

