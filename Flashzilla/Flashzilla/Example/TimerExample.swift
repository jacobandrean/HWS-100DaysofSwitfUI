//
//  TimerExample.swift
//  Flashzilla
//
//  Created by Jacob Andrean on 03/09/21.
//

import SwiftUI

struct TimerExample: View {
    let timer = Timer.publish(every: 1, tolerance: 0.5, on: .main, in: .common).autoconnect()
    
    @State private var counter = 0
    
    var body: some View {
        Text("Hello, world!")
            .onReceive(timer, perform: { time in
                if self.counter == 5 {
                    self.timer.upstream.connect().cancel()
                } else {
                    print("The time is now \(time)")
                }
                
                self.counter += 1
            })
    }
}
