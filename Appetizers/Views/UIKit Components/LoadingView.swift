//
//  LoadingView.swift
//  Appetizers
//
//  Created by Mehul Jain on 21/07/24.
//

import SwiftUI

struct ActivityInidcator: UIViewRepresentable{
    
    func makeUIView(context:Context) -> UIActivityIndicatorView{
        let activityIndicatorView = UIActivityIndicatorView(style: .large)
        activityIndicatorView.color = UIColor.branddPrimary
        activityIndicatorView.startAnimating()
        return activityIndicatorView
    }
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}
    
}
struct LoadingView: View{
    var body:some View{
        ZStack{
            Color(.systemBackground)
                .ignoresSafeArea(.all)
            ActivityInidcator()
        }
    }
}
