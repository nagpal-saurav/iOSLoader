//
//  File.swift
//  
//
//  Created by Saurav Nagpal on 29/03/23.
//

import Foundation
import SwiftUI

@available(iOS 13.0, *)
class iOActivityFactory{
    public class func ActivityWithType(_ type: iOSLoaderActivityIndicatorType, isAnimating: Binding<Bool>) -> ActivityIndicatorView {
        let activityFrame = CGRect(x: 0, y: 0, width: 40, height: 40)
        switch type {
        case .standard:
            return DefaultActivityIndicator(frame: activityFrame)
        case .circleArc:
            return CircleArcActivityIndicatorView(frame: activityFrame)
        case .circleFill:
            return CircleArcActivityIndicatorView(frame: activityFrame)
        }
    }
}
