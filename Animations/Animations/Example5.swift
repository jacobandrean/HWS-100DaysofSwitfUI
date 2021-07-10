//
//  Example5.swift
//  Animations
//
//  Created by Jacob Andrean on 08/07/21.
//

import SwiftUI

struct Example5: View {
    @State private var dragAmount = CGSize.zero
    
    var fingerDrag: some Gesture {
        DragGesture()
            .onChanged { self.dragAmount = $0.translation }
            .onEnded { _ in
                withAnimation(.spring()) {
                    self.dragAmount = .zero
                }
            }
    }
    
    var body: some View {
        VStack {
            LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(width: 300, height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .offset(dragAmount)
                .gesture(fingerDrag)
        }
    }
}

struct Example5_Previews: PreviewProvider {
    static var previews: some View {
        Example5()
    }
}
