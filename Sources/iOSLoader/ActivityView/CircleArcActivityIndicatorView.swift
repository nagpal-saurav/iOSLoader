//
//  SDCircleArc.swift
//  SDLoadingViewExample
//

import UIKit
import Foundation
import SwiftUI

class CircleArcActivityIndicatorView: UIView, ActivityIndicatorView {
    var hideWhenStop: Bool = true
    var isAnimating: Bool = false

    //MARK: - IVar
    fileprivate var progressShape: CAShapeLayer?
    fileprivate var backgroundShape: CAShapeLayer?
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
        let backgroundShape = SDShapeFactory.shapeWithType(.circle(fillColor: UIColor.clear, strokeColor: UIColor.lightGray), size: self.frame.size)
        backgroundShape.position = self.center
        backgroundShape.lineWidth = strokeWidth
        backgroundShape.fillColor = UIColor.clear.cgColor
        self.layer.addSublayer(backgroundShape)
        self.backgroundShape = backgroundShape
        
        let progressShape = SDShapeFactory.shapeWithType(.circle(fillColor: UIColor.clear, strokeColor: UIColor.lightGray), size: self.frame.size)
        progressShape.position = backgroundShape.position
        if #available(iOS 15.0, *) {
            progressShape.strokeColor = UIColor.tintColor.cgColor
        } else {
            // Fallback on earlier versions
            progressShape.strokeColor = UIColor.purple.cgColor
        }
        progressShape.lineWidth = strokeWidth
        progressShape.strokeEnd = CGFloat(percent / 100.0)
        self.layer.addSublayer(progressShape)
        self.progressShape = progressShape
    }
    
    //MARK: - Loading Animation Delegate
    func startAnimating() {
        self.addAnimation(duration: 10.0, delay: 0.0)
    }
    
    func stopAnimating() {
        //activityIndicatorView.isHidden = hideWhenStop
    }
    
    func addAnimation(duration: TimeInterval, delay: TimeInterval) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.beginTime = CACurrentMediaTime() + delay
        animation.duration = duration
        animation.fromValue = 0
        animation.toValue = 1
        animation.timingFunction = CAMediaTimingFunction(name: .easeIn)
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        
        self.progressShape?.removeAnimation(forKey: "circleAnimation")
        self.progressShape?.strokeEnd = 0
        self.progressShape?.add(animation, forKey: "circleAnimation")
    }
}

