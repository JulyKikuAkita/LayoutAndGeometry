//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Ifang Lee on 4/11/22.
//

import SwiftUI

// applying modifiers creates new views rather than just modifying existing views in-place.
struct ContentView: View {
    var body: some View {
        Group {
            Text("Layout Neutral")
                .background(.green)
                .padding(20)

            Text("Layout Neutral")
                .padding(20)
                .background(.green)

            Color.blue
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
