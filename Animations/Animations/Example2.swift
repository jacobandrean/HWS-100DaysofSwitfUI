//
//  Example2.swift
//  Animations
//
//  Created by Jacob Andrean on 08/07/21.
//

import SwiftUI

struct Example2: View {
    @State private var animationAmount: CGFloat = 1
    var body: some View {
        print(animationAmount)
        return VStack {
            Stepper("Scale amount",
                    value: $animationAmount.animation(
                        .easeInOut(duration: 1)
                            .repeatCount(3, autoreverses: true)),
                    in: 1...10
            )
            Spacer()
            Button("Tap Me") {
                self.animationAmount += 1
            }
            .padding(40)
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
        }
    }
}

struct Example2_Previews: PreviewProvider {
    static var previews: some View {
        Example2()
    }
}
