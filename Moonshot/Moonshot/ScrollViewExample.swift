//
//  ScrollViewExample.swift
//  Moonshot
//
//  Created by Jacob Andrean on 22/07/21.
//

import SwiftUI

struct CustomText: View {
    var text: String
    
    var body: some View {
        Text(text)
    }
    
    init(_ text: String) {
        print("Creating a CustomText")
        self.text = text
    }
}

/// ScrollView will instantantiate all CustomText, while List will create CustomText lazily (created when needed)
struct ScrollViewExample: View {
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 10) {
                ForEach(0..<10000) {
                    CustomText("Item \($0)")
                        .font(.title)
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct ScrollViewExample_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewExample()
    }
}
