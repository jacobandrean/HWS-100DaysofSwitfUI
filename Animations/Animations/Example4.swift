//
//  Example4.swift
//  Animations
//
//  Created by Jacob Andrean on 08/07/21.
//

import SwiftUI

struct Example4: View {
    @State private var enabled = false
    var body: some View {
        Button("Tap me") {
            self.enabled.toggle()
        }
        .frame(width: 200, height: 200)
        .background(enabled ? Color.blue : Color.red)
        .animation(nil)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
        .animation(.interpolatingSpring(stiffness: 10, damping: 1))
    }
}

struct Example4_Previews: PreviewProvider {
    static var previews: some View {
        Example4()
    }
}
