//
//  DateExample.swift
//  BetterRest
//
//  Created by Jacob Andrean on 01/07/21.
//

//https://www.hackingwithswift.com/books/ios-swiftui/working-with-dates
import SwiftUI

struct DateExample: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUP = Date()
    var body: some View {
        let now = Date()
        let tomorrow = Date().addingTimeInterval(86400)
        let range = now...tomorrow
        
        VStack {
            Stepper(value: $sleepAmount, in: 4...12, step: 0.2) {
                Text("\(sleepAmount, specifier: "%g") hours")
            }
            DatePicker("example 1", selection: $wakeUP, displayedComponents: .hourAndMinute)
            DatePicker("example 2", selection: $wakeUP, in: ...Date())
            DatePicker("example 3", selection: $wakeUP, in: Date()...)
            DatePicker("example 4", selection: $wakeUP, in: range)
        }
    }
}

struct DateExample_Previews: PreviewProvider {
    static var previews: some View {
        DateExample()
    }
}
