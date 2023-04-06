//
//  File.swift
//  
//
//  Created by Saurav Nagpal on 03/03/23.
//

import Foundation
import SwiftUI

protocol ActivityIndicatorView where Self:UIView {
    var isAnimating: Bool { get set }
    var hideWhenStop: Bool { get set }
    
    func startAnimating()
    func stopAnimating()
}
