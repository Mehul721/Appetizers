//
//  CustomModifiers.swift
//  Appetizers
//
//  Created by Mehul Jain on 05/08/24.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier{
    func body(content:Content) -> some View{
        content
            .buttonStyle(.bordered)
            .tint(.branddPrimary)
            .controlSize(.large)
    }
}
