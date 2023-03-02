//
//  File.swift
//  
//
//  Created by Saurav Nagpal on 02/03/23.
//

import Foundation
import SwiftUI

@available(iOS 14, *)
struct DefaultActivityIndicator: UIViewRepresentable {
    typealias UIViewType = UIActivityIndicatorView
    
    @Binding var isAnimating: Bool
    let style: UIActivityIndicatorView.Style

    func makeUIView(context: UIViewRepresentableContext<DefaultActivityIndicator>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<DefaultActivityIndicator>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}
