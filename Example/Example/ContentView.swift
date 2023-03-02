//
//  ContentView.swift
//  Example
//
//  Created by Saurav Nagpal on 02/03/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(
                    columns: [GridItem(.adaptive(minimum: 300))],
                    spacing: 16
                ) {
                    Playground()
                    Color.clear.frame(height: 40)
                }
                .padding()
            }
            .background(Color(uiColor: .secondarySystemBackground))
            .navigationTitle("Loader")
        }
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
