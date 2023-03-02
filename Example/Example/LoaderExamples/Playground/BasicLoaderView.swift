//
//  SwiftUIView.swift
//  
//
//  Created by Saurav Nagpal on 02/03/23.
//

import SwiftUI
import iOSLoader

struct BasicLoaderView: View {
    @State var isLoading = true
    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .center) {
                iOSLoader(show: $isLoading) {
                    
                }
            }.frame(width: geo.size.width, height: geo.size.height)
        }
    }
}

struct BasicLoaderView_Previews: PreviewProvider {
    static var previews: some View {
        BasicLoaderView()
    }
}
