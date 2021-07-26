//
//  ArrowChallenge.swift
//  Drawing
//
//  Created by Jacob Andrean on 25/07/21.
//

import SwiftUI

struct ArrowView: View {
    var triangleWidth: CGFloat
    var rectangleWidth: CGFloat
    
    var body: some View {
        VStack(spacing: 0) {
            Triangle()
                .frame(width: self.triangleWidth, height: 100, alignment: .center)
            Rectangle()
                .frame(width: self.rectangleWidth, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
    }
}

struct ArrowChallenge: View {
    @State private var triangleWidth: CGFloat = 100
    @State private var rectangleWidth: CGFloat = 20
    var body: some View {
        ArrowView(triangleWidth: triangleWidth, rectangleWidth: rectangleWidth)
            .onTapGesture {
                withAnimation(.linear(duration: 3)) {
                    self.triangleWidth *= 1.5
                    self.rectangleWidth *= 1.5
                }
            }
    }
}

struct ArrowChallenge_Previews: PreviewProvider {
    static var previews: some View {
        ArrowChallenge()
    }
}
