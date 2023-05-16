//
//  SDShapeCircle.swift
//  SDLoadingViewExample
//
//  Created by Saurav Nagpal on 18/01/19.
//  Copyright © 2019 Saurav Nagpal. All rights reserved.
//

import UIKit

class SDShapeCircle: SDShapeDrawable {
    
    //MARK:- Static  Method
    func shapeWithSize(_ size: CGSize, fillColor: UIColor, strokeColor: UIColor) -> CAShapeLayer {
        let layer = CAShapeLayer()
        let circleRect = CGRect(origin: CGPoint(x: -size.width/2, y: -size.height/2), size: size)
        layer.path = UIBezierPath(ovalIn: circleRect).cgPath
        layer.fillColor = fillColor.cgColor
        layer.strokeColor = strokeColor.cgColor
        return layer
    }
}
