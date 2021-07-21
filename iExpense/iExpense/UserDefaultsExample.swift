//
//  UserDefaultsExample.swift
//  iExpense
//
//  Created by Jacob Andrean on 21/07/21.
//

import SwiftUI

struct UserDefaultsExample: View {
    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    
    var body: some View {
        Button("Tap count: \(tapCount)") {
            tapCount += 1
            UserDefaults.standard.set(tapCount, forKey: "Tap")
        }
    }
}

struct UserDefaultsExample_Previews: PreviewProvider {
    static var previews: some View {
        UserDefaultsExample()
    }
}
