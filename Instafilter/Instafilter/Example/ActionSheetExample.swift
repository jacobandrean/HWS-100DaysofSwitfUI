//
//  ActionSheetView.swift
//  Instafilter
//
//  Created by Jacob Andrean on 13/08/21.
//

import SwiftUI

struct ActionSheetExample: View {
    @State private var showingActionSheet = false
    @State private var backgroundColor = Color.secondary
    
    var body: some View {
        Text("Hello, world!")
            .frame(width: 300, height: 300)
            .background(backgroundColor)
            .onTapGesture {
                self.showingActionSheet = true
            }
            .actionSheet(isPresented: $showingActionSheet, content: {
                ActionSheet(
                    title: Text("Change Background"),
                    message: Text("Select a new color"),
                    buttons: [
                        .default(Text("Red")) { self.backgroundColor = .red },
                        .default(Text("Green")) { self.backgroundColor = .green },
                        .default(Text("Blue")) { self.backgroundColor = .blue },
                        .cancel()
                    ]
                )
            })
    }
}

struct ActionSheetView_Previews: PreviewProvider {
    static var previews: some View {
        ActionSheetExample()
    }
}
