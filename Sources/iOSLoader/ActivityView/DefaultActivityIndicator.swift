//
//  File.swift
//  
//
//  Created by Saurav Nagpal on 02/03/23.
//

import Foundation
import UIKit

@available(iOS 13.0, *)
class DefaultActivityIndicator: UIView, ActivityIndicatorView {
    //MARK: - IVar
    var isAnimating: Bool = false
    var hideWhenStop: Bool = true
    private let activityIndicatorView = UIActivityIndicatorView(style: .large)

    //MARK: - Life Cycle Method
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.prepareActivityIndicatorView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.prepareActivityIndicatorView()
    }
    
    //MARK: - Setup Activity View
    func prepareActivityIndicatorView(){
        self.addSubview(self.activityIndicatorView)
        activityIndicatorView.hidesWhenStopped = true
        activityIndicatorView.style = .large
        activityIndicatorView.setViewInCenterToView(self, withSize: frame.size)
    }
    
    //MARK: - Loading Animation Delegate
    func startAnimating() {
        activityIndicatorView.startAnimating()
    }
    
    func stopAnimating() {
        activityIndicatorView.stopAnimating()
        activityIndicatorView.isHidden = hideWhenStop
    }
}
