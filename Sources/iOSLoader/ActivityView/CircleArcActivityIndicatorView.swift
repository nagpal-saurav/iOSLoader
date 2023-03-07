//
//  SDCircleArc.swift
//  SDLoadingViewExample
//

import UIKit
import Foundation
import SwiftUI

class CircleArcActivityIndicatorView: UIView, ActivityIndicatorView {
    var isAnimating: Bool = false

    //MARK: - IVar
    fileprivate let progressShape = CAShapeLayer()
    fileprivate let backgroundShape = CAShapeLayer()
    fileprivate let strokeWidth: CGFloat = 10
    fileprivate var percent: Double = 0

    
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
    func prepareActivityIndicatorView() {
        //setup background shape
        backgroundShape.frame = self.frame
        backgroundShape.path = UIBezierPath(ovalIn: frame).cgPath
        backgroundShape.position = self.center
        backgroundShape.strokeColor = UIColor.black.cgColor
        backgroundShape.lineWidth = strokeWidth
        backgroundShape.fillColor = UIColor.clear.cgColor
        
        progressShape.frame = frame
        progressShape.path = backgroundShape.path
        progressShape.position = backgroundShape.position
        progressShape.strokeColor = UIColor.red.cgColor
        progressShape.lineWidth = strokeWidth
        progressShape.fillColor = UIColor.clear.cgColor
        progressShape.strokeEnd = CGFloat(percent / 100.0)
    }
    
    //MARK: - Loading Animation Delegate
    func startAnimating() {
    }
    
    func stopAnimating() {
    
    }
}

