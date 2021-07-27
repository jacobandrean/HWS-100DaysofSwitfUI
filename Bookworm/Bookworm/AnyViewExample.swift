//
//  AnyViewExample.swift
//  Bookworm
//
//  Created by Jacob Andrean on 26/07/21.
//

import SwiftUI

struct AnyViewExample: View {
    @Environment(\.horizontalSizeClass) var sizeClass
    var body: some View {
        if sizeClass == .compact {
            return AnyView(
                VStack {
                    Text("Active size class:")
                    Text("COMPACT")
                }
                .font(.largeTitle)
            )
        } else {
            return AnyView(
                HStack {
                    Text("Active size class:")
                    Text("REGULAR")
                }
                .font(.largeTitle)
            )
        }
    }
}

struct AnyViewExample_Previews: PreviewProvider {
    static var previews: some View {
        AnyViewExample()
    }
}
