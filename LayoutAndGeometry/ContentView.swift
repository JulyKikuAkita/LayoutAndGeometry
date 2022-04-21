//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Ifang Lee on 4/11/22.
//

import SwiftUI

struct RotationEffectBasicView: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]
    var body: some View {
        ScrollView {
            ForEach(0..<50) { index in
                GeometryReader { geo in
                    Text("Row #\(index)")
                        .font(.title)
                        .frame(maxWidth: .infinity)
                        .background(colors [index % 7])
                        .rotation3DEffect(.degrees(geo.frame(in: .global).minY / 5), axis: (x: 0, y :1, z: 0))
                }
                .frame(height: 40)
            }
        }
    }
}

/*
 Challenge:

 Make views near the top of the scroll view fade out to 0 opacity – I would suggest starting at about 200 points from the top.
 Make views adjust their scale depending on their vertical position, with views near the bottom being large and views near the top being small. I would suggest going no smaller than 50% of the regular size.
 For a real challenge make the views change color as you scroll. For the best effect, you should create colors using the Color(hue:saturation:brightness:) initializer, feeding in varying values for the hue.

 */
struct NatualRotationView: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]

    var body : some View {
        GeometryReader { fullView in
            ScrollView {
                ForEach(0..<50) { index in
                    GeometryReader { geo in
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity,
                                   minHeight: geo.frame(in: .global).minY > fullView.size.height / 2 ? 5 : 50)
                            .background(Color(hue: geo.frame(in: .local).minY, saturation: geo.frame(in: .local).maxX, brightness: geo.frame(in: .local).maxY))
                            .opacity(geo.frame(in: .global).minY / 190)
                            .rotation3DEffect(.degrees(geo.frame(in: .global).minY - fullView.size.height / 2) / 5, axis: (x: 0, y :1, z: 0))
                    }
                    .frame(height: 40)
                }
            }
        }
    }
}

struct CoverFlowScrollView : View {
    var body: some View {
        ScrollView (.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(1..<20) { num in
                    GeometryReader { geo in
                        Text("Number \(num)")
                            .font(.largeTitle)
                            .padding()
                            .background(.red)
                            .rotation3DEffect(.degrees(-geo.frame(in: .global).minX), axis: (x: 0, y: 1, z: 0))
                            .frame(width: 200, height: 200)
                    }
                    .frame(width: 200, height: 200)
                }
            }
        }
    }
}

struct ContentView: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]

    var body: some View {
//        RotationEffectBasicView()
        NatualRotationView()
//        CoverFlowScrollView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
