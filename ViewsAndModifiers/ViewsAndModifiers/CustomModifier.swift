//
//  CustomModifier.swift
//  ViewsAndModifiers
//
//  Created by Jacob Andrean on 27/06/21.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
    
    func waterMark(with text: String) -> some View {
        self.modifier(Watermark(text: text))
    }
}

struct Watermark: ViewModifier {
    var text: String
    func body(content: Content) -> some View {
        ZStack(alignment: .center) {
            content
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(Color.black)
        }
    }
}

struct CustomModifier: View {
    var body: some View {
        Color.blue
            .frame(width: 300, height: 300)
            .waterMark(with: "hacking with swift")
    }
}

struct CustomModifier_Previews: PreviewProvider {
    static var previews: some View {
        CustomModifier()
    }
}
