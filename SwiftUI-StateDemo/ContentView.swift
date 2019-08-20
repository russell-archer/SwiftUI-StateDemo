//
//  ContentView.swift
//  SwiftUI-StateDemo
//
//  Created by Russell Archer on 03/08/2019.
//  Copyright © 2019 Russell Archer. All rights reserved.
//
// Tested and working with Xcode 11 Beta 6 on Mojave 10.14.6
//
//

import SwiftUI

struct ContentView: View {
    // When any of these @State variables change the View is re-rendered
    @State private var showHint = false
    @State private var bgColor = Color.green
    
    var body: some View {
        VStack {
            // Create a two-way binding between the Toggle and the showHint state variable.
            // When one changes the other is automatically changed too.
            // Use the $ prefix operator to specify a binding.
            Toggle(isOn: $showHint) {
                Text(showHint ? "Hide hint" : "Show hint")
            }
            
            if showHint {
                Text("See what happens if you tap the circle 👀")
                    .lineLimit(nil)
                    .multilineTextAlignment(.leading)
            }
            
            Circle()
                .fill(bgColor)
                .frame(width: 150, height: 150)
                .onTapGesture {
                    withAnimation {
                        self.bgColor = colorToggle.nextColor(currentColor: self.bgColor)  // Animates between colors 🤯
                    }
                }
            
            Spacer()
        }
        .padding()
    }
}

struct colorToggle {
    static func nextColor(currentColor: Color) -> Color {
        switch currentColor {
            case .green: return Color.red
            case .red: return Color.blue
            case .blue: return Color.green
            default: return Color.green
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
