//
//  NavigationLinkExample.swift
//  Moonshot
//
//  Created by Jacob Andrean on 22/07/21.
//

import SwiftUI

struct NavigationLinkExample: View {
    var body: some View {
        NavigationView {
            List(0..<100) { row in
                NavigationLink(
                    destination: Text("Destination \(row)"),
                    label: {
                        Text("Row \(row)")
                    })
            }
            .navigationBarTitle("SwiftUI")
        }
    }
}

struct NavigationLinkExample_Previews: PreviewProvider {
    static var previews: some View {
        NavigationLinkExample()
    }
}
