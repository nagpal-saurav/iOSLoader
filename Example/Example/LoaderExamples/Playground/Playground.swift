//
//  SwiftUIView.swift
//  
//
//  Created by Saurav Nagpal on 02/03/23.
//

import SwiftUI

struct Playground: View {
    var body: some View {
        Section(
            header:
            Text("Playground")
                .foregroundColor(.secondary)
                .frame(maxWidth: .infinity, alignment: .leading)
        ) {
            Group {
                BasicLoaderView().frame(width: 150, height: 150)
                CircularArcLoaderView().frame(width: 150, height: 150)
            }
        }
    }
}

struct Playground_Previews: PreviewProvider {
    static var previews: some View {
        Playground()
    }
}
