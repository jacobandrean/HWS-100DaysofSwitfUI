//
//  TouchIDFaceIDExample.swift
//  BucketList
//
//  Created by Jacob Andrean on 15/08/21.
//

import LocalAuthentication
import SwiftUI

struct TouchIDFaceIDExample: View {
    @State private var isUnlocked = false
    
    var body: some View {
        VStack {
            if self.isUnlocked {
                Text("Unlocked")
            } else {
                Text("Locked")
            }
        }
        .onAppear(perform: authenticate)
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "We need to unlock your data"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, error in
                DispatchQueue.main.async {
                    if success {
                        self.isUnlocked = true
                    } else {
                        
                    }
                }
            }
        } else {
            
        }
    }
}

struct TouchIDFaceIDExample_Previews: PreviewProvider {
    static var previews: some View {
        TouchIDFaceIDExample()
    }
}
