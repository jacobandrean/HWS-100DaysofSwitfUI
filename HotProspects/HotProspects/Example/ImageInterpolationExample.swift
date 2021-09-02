//
//  ImageInterpolationExample.swift
//  HotProspects
//
//  Created by Jacob Andrean on 02/09/21.
//

import SwiftUI

struct ImageInterpolationExample: View {
    var body: some View {
        Image("example")
            .interpolation(.none)
            .resizable()
            .scaledToFit()
            .frame(maxHeight: .infinity)
            .background(Color.black)
            .ignoresSafeArea(.all)
    }
}

struct ImageInterpolationExample_Previews: PreviewProvider {
    static var previews: some View {
        ImageInterpolationExample()
    }
}
