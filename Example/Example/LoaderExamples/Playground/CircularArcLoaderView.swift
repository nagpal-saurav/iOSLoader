//
//  CircularArcLoaderView.swift
//  Example
//
//  Created by Saurav Nagpal on 07/03/23.
//

import SwiftUI
import iOSLoader

struct CircularArcLoaderView: View {
    @State var isLoading = true
    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .center) {
                iOSLoader(show: $isLoading, type: .circleArc) {
                    
                }
            }
        }
    }
}

struct CircularArcLoaderView_Previews: PreviewProvider {
    static var previews: some View {
        CircularArcLoaderView()
    }
}
