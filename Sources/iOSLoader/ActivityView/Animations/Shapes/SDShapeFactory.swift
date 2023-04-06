//
//  Shape.swift
//  SDLoadingViewExample
//
//  Created by Saurav Nagpal on 13/01/19.
//  Copyright © 2019 Saurav Nagpal. All rights reserved.
//

import UIKit

enum SDShape {
    case circle(fillColor: UIColor, strokeColor: UIColor)
}

protocol SDShapeDrawable {
    func shapeWithSize(_ size: CGSize, fillColor: UIColor, strokeColor: UIColor) -> CAShapeLayer
}

class SDShapeFactory{
    public class func shapeWithType(_ type: SDShape, size:CGSize) -> CAShapeLayer {
        switch type {
        case .circle(let fillColor, let strokeColor):
            return SDShapeCircle().shapeWithSize(size, fillColor: fillColor, strokeColor: strokeColor)
        }
    }
}
