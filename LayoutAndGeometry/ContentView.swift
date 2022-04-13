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
        AlignmentView()
        AlignmentGuideView()
        simpleAlignmentView()
        LayoutView()
    }
}

struct AlignmentGuideView: View {
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                       Text("alignment: .leading")
                       Text("This is a longer line of text")
                   }
                   .background(.red)
                   .frame(width: 300, height: 300)
                   .background(.blue)

            // same as above
            VStack(alignment: .leading) {
                Text("alignment: .leading")
                    .alignmentGuide(.leading) { d in d[.leading] }
                Text("Rewrite in alignmentGuide")
            }
            .padding()

            // alignment guide to use the view’s trailing edge for its leading alignment guide
            VStack(alignment: .leading) {
                Text("alignment: .leading")
                    .alignmentGuide(.leading) { d in d[.trailing] }
                Text("Rewrite in alignmentGuide")
            }
        }

    }
}

struct AlignmentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(0..<10) { position in
                Text("Number \(position)")
                    .alignmentGuide(.leading) { _ in CGFloat(position) * -10 }
            }
        }
        .background(.red)
        .frame(width: 400, height: 400)
        .background(.gray)
    }
}

struct simpleAlignmentView: View {
    var body: some View {
        VStack {
            Text("Live long and prosper")
                .frame(width: 300, height: 300, alignment: .topLeading)

            HStack(alignment: .bottom) {
                Text("Live")
                    .font(.caption)
                Text("long")
                Text("and")
                    .font(.title)
                Text("prosper")
                    .font(.largeTitle)
            }

            HStack(alignment: .lastTextBaseline) { //try .bottom
                Text("Live")
                    .font(.caption)
                Text("long")
                Text("and")
                    .font(.title)
                Text("prosper")
                    .font(.largeTitle)
            }
        }
    }
}

struct LayoutView: View {
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
