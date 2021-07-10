//
//  ListExample.swift
//  WordScramble
//
//  Created by Jacob Andrean on 01/07/21.
//

import SwiftUI

struct ListExample: View {
    let people = ["finn", "Leila", "han", "rey"]
    var body: some View {
        VStack {
            List {
                ForEach(people, id: \.self) {
                    Text($0)
                }
            }
            
            List {
                Section(header: Text("Section 1")) {
                    Text("Static row 1")
                }

                Section(header: Text("Section 2")) {
                    ForEach(0..<5) {
                        Text("Hello World \($0)")
                    }
                }
                Section(header: Text("Section 3")) {
                    Text("Static row 2")
                }
            }
            .listStyle(GroupedListStyle())
            
            List(8..<100) {_ in
                Text("dynamic row")
            }
        }
        
    }
}

struct ListExample_Previews: PreviewProvider {
    static var previews: some View {
        ListExample()
    }
}
