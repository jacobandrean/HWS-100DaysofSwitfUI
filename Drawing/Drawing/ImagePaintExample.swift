//
//  ImagePaintExample.swift
//  Drawing
//
//  Created by Jacob Andrean on 22/07/21.
//

import SwiftUI

struct ImagePaintExample: View {
    var body: some View {
//        Text("Hello, World!")
//            .frame(width: 300, height: 300)
//            .border(ImagePaint(image: Image("Example"),sourceRect: CGRect(x: 0, y: 0.25, width: 1, height: 0.5), scale: 0.2), width: 30)
        Capsule()
            .strokeBorder(ImagePaint(image: Image("Example"), scale: 0.1), lineWidth: 50)
            .frame(width: 300, height: 300, alignment: .center)
    }
}

struct ImagePaintExample_Previews: PreviewProvider {
    static var previews: some View {
        ImagePaintExample()
    }
}
