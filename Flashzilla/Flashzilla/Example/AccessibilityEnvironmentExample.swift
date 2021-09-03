//
//  AccessibilityEnvironmentExample.swift
//  Flashzilla
//
//  Created by Jacob Andrean on 03/09/21.
//

import SwiftUI

func withOptionalAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
    if UIAccessibility.isReduceMotionEnabled {
        return try body()
    } else {
        return try withAnimation(animation, body)
    }
}

struct AccessibilityReduceTransparency: View {
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency
    
    var body: some View {
        Text("Hello wordl")
            .padding()
            .background(reduceTransparency ? Color.black : Color.black.opacity(0.5))
            .foregroundColor(.white)
            .clipShape(Circle())
    }
}

struct AccessibilityReduceMotion2: View {
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    @State private var scale: CGFloat = 1
    
    var body: some View {
        Text("Hello wordl")
            .scaleEffect(scale)
            .onTapGesture {
                withOptionalAnimation {
                    self.scale *= 1.5
                }
            }
    }
}

struct AccessibilityReduceMotion1: View {
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    @State private var scale: CGFloat = 1
    
    var body: some View {
        Text("Hello wordl")
            .scaleEffect(scale)
            .onTapGesture {
                if self.reduceMotion {
                    self.scale *= 1.5
                } else {
                    withAnimation {
                        self.scale *= 1.5
                    }
                }
            }
    }
}

struct AccessibilityDifferentiateWithoutColor: View {
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    
    var body: some View {
        HStack {
            if differentiateWithoutColor {
                Image(systemName: "checkmark.circle")
            }
            
            Text("Success")
        }
        .padding()
        .background(differentiateWithoutColor ? Color.black : Color.green)
        .foregroundColor(.white)
        .clipShape(Circle())
    }
}
