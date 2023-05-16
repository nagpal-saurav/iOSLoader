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
    public class func ActivityWithType(activityFrame: CGRect, _ type: iOSLoaderActivityIndicatorType, isAnimating: Binding<Bool>) -> ActivityIndicatorView {
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
