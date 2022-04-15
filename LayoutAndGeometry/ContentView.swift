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

 offset vs position
 When we use the offset() modifier, we’re changing the location where a view should be rendered without actually changing its underlying geometry. This means when we apply background() afterwards it uses the original position of the text, not its offset.
 */
import SwiftUI

// applying modifiers creates new views rather than just modifying existing views in-place.

struct ContentView: View {
    var body: some View {
        VStack {
            VStack {
                Text("offset1")
                    .offset(x: 100, y: 100)
                    .background(.green)

                Text("offset2")
                    .background(.green)
                    .offset(x: 100, y: 100)

                Text("Position1")
                    .background(.gray)
                    .position(x: 100, y: 100)

                Text("Position2")
                    .position(x: 100, y: 100)
                    .background(.gray)
            }

            HStack(alignment: .midAccountAndName) {
                VStack {
                    Text("@twostraws")
                        .alignmentGuide(.midAccountAndName) { d in d[VerticalAlignment.center]

                        }
                    Image("nanachi1")
                       .resizable()
                       .frame(width: 64, height: 64)
                    }

               VStack {
                   Text("Full name:")
                   Text("PAUL HUDSON")
                       .alignmentGuide(.midAccountAndName) {
                           d in d[VerticalAlignment.center]
                       }
                       .font(.largeTitle)
               }
            }
        }
    }
}

/*
 define a custom layout guide. This should be an extension on either VerticalAlignment or HorizontalAlignment, and be a custom type that conforms to the AlignmentID protocol.

 it’s actually a good idea to implement this as an enum instead of struct. The AlignmentID protocol has only one requirement, which is that the conforming type must provide a static defaultValue(in:) method that accepts a ViewDimensions object and returns a CGFloat specifying how a view should be aligned if it doesn’t have an alignmentGuide() modifier. You’ll be given the existing ViewDimensions object for the view, so you can either pick one of those for your default or use a hard-coded value.

 we just created a new struct called MidAccountAndName, which means we could (if we wanted) create an instance of that struct even though doing so doesn’t make sense because it doesn’t have any functionality. If you replace struct MidAccountAndName with enum MidAccountAndName then you can’t make an instance of it any more – it becomes clearer that this thing exists only to house some functionality.

 usage: set midAccountAndName as the alignment for your stack, then use alignmentGuide() to activate it on any views you want to align together. This is only a guide: it helps you align views along a single line, but doesn’t say how they should be aligned. This means you still need to provide the closure to alignmentGuide() that positions the views along that guide as you want.

 */
extension VerticalAlignment {
    enum MidAccountAndName: AlignmentID { //could be a struct
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d[.top]
        }
    }

    static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
