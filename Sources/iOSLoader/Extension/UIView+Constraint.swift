//
//  File.swift
//  
//
//  Created by Saurav Nagpal on 03/03/23.
//

import Foundation
import UIKit

extension UIView{
    func setViewInCenterToView(_ containerView:UIView, withSize size:CGSize){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setSizeEqualTo(size)
        self.setCenterToView(containerView)
    }
    
    func setCenterToView(_ containerView:UIView){
        self.setCenterXToView(containerView)
        self.setCenterYToView(containerView)
    }
    
    func setCenterXToView(_ centerToView:UIView){
        let xConstraint = NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: centerToView, attribute: .centerX, multiplier: 1, constant: 0)
        centerToView.addConstraint(xConstraint)
    }
    
    func setCenterYToView(_ centerToView:UIView){
        let yConstraint = NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: centerToView, attribute: .centerY, multiplier: 1, constant: 0)
        centerToView.addConstraint(yConstraint)
    }
    
    func setTopFromView(_ top:CGFloat, topView:UIView){
        let topConstraint = NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: topView, attribute: .bottom, multiplier: 1, constant: top)
        self.superview?.addConstraint(topConstraint)
    }
    
    func setSizeEqualTo(_ size:CGSize){
        let width = NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: size.width)
        let height = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: size.height)
        self.addConstraints([width, height])
    }
}
