//
//  Example3.swift
//  Animations
//
//  Created by Jacob Andrean on 08/07/21.
//

import SwiftUI

struct Example3: View {
    @State private var animationAmount = 0.0
    
    var body: some View {
        Button("Tap me") {
            withAnimation(
                .interpolatingSpring(stiffness: 5, damping: 1)
            ) {
                self.animationAmount += 360
            }
        }
        .padding(50)
        .background(Color.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .rotation3DEffect(
            .degrees(animationAmount),
            axis: (x: 1.0, y: 1.0, z: 0.0)
        )
    }
}

struct Example3_Previews: PreviewProvider {
    static var previews: some View {
        Example3()
    }
}
