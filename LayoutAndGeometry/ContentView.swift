//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Ifang Lee on 4/11/22.
//

import SwiftUI

/*
 https://www.hackingwithswift.com/guide/ios-swiftui/7/3/challenge
 Day 95:
 1. Let the user customize the dice that are rolled: how many of them, and what type: 4-sided, 6-sided, 8-sided, 10-sided, 12-sided, 20-sided, and even 100-sided.
 2. Show the total rolled on the dice.
 3. Store the results using JSON or Core Data – anywhere they are persistent.
 4. Add haptic feedback when dice are rolled.
 5. For a real challenge, make the value rolled by the dice flick through various possible values before settling on the final figure.
 When I say “roll dice” you don’t need to create fancy 3D effects – just showing the numbers that were “rolled” is fine.

 The only thing that might cause you some work is step 5: making the results flick through various values before settling on the final figure. The easiest way to tackle this is through a Timer that gets cancelled after a certain number of calls.


 */
struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
