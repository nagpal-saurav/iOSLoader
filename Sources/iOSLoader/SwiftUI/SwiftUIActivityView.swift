//
//  SwiftUIView.swift
//  
//
//  Created by Saurav Nagpal on 03/03/23.
//

import SwiftUI

@available(iOS 13.0, *)
struct SwiftUIActivityView: UIViewRepresentable {
    typealias UIViewType = UIView
    @Binding var isAnimating: Bool
    private var activityIndicator: iOSLoaderActivityIndicatorType
    
    init(activityIndicator: iOSLoaderActivityIndicatorType, isAnimating: Binding<Bool>) {
        self.activityIndicator = activityIndicator
        _isAnimating = isAnimating
    }
    
    func makeUIView(context: Context) -> UIView {
        return iOActivityFactory.ActivityWithType(self.activityIndicator, isAnimating: _isAnimating)
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        if let activityView = uiView as? ActivityIndicatorView {
            isAnimating ? activityView.startAnimating() : activityView.stopAnimating()
        }
    }
}
