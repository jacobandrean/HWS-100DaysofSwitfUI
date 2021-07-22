//
//  ContentView.swift
//  Moonshot
//
//  Created by Jacob Andrean on 22/07/21.
//

import SwiftUI

struct GeometryReaderExample: View {
    var body: some View {
        VStack {
            GeometryReader { geo in
                Image("example")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geo.size.width)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderExample()
    }
}
