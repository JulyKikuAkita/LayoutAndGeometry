//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Ifang Lee on 4/11/22.
//
/*
 -A parent view proposes a size for its child.
 -Based on that information, the child then chooses its own size and the parent must respect that choice.
 - The parent then positions the child in its coordinate space.
 - Behind the scenes, SwiftUI performs a fourth step: although it stores positions and sizes as floating-point numbers, when it comes to rendering SwiftUI rounds off any pixels to their nearest values so our graphics remain sharp.
 */
import SwiftUI

// applying modifiers creates new views rather than just modifying existing views in-place.
struct ContentView: View {
    var body: some View {
        Group { // the text view becomes a child of its background
            Text("Layout Neutral")
                .background(.green) // layout neutral
                .padding(20)

            Text("Layout Neutral")
                .padding(20)
                .background(.green) //layout neutral

            Color.blue
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
