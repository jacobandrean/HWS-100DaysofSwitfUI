//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Jacob Andrean on 27/06/21.
//

import SwiftUI

struct MyCustomModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

extension View {
    func setWithMyModifier() -> some View {
        self.modifier(MyCustomModifier())
    }
}

struct ContentView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .setWithMyModifier()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
