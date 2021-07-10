//
//  Example1.swift
//  Animations
//
//  Created by Jacob Andrean on 08/07/21.
//

import SwiftUI

struct Example1: View {
    @State private var animationAmount: CGFloat = 1
    
    var body: some View {
        Button("Tap me") {
//            self.animationAmount += 1
        }
        .padding(50)
        .background(Color.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .overlay(
            Circle()
                .stroke(Color.red)
                .scaleEffect(animationAmount)
                .opacity(Double(2 - animationAmount))
                .animation(
                    .easeInOut(duration: 1)
                        .repeatForever(autoreverses: false)
        )
//        .scaleEffect(animationAmount)
//        .blur(radius: (animationAmount - 1) * 3)
//        .animation(
//            .easeInOut(duration: 1)
//                .repeatForever(autoreverses: true)
        )
        .onAppear {
            self.animationAmount = 2
        }
    }
}

struct Example1_Previews: PreviewProvider {
    static var previews: some View {
        Example1()
    }
}
