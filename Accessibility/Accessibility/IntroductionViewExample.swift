//
//  IntroductionViewExample.swift
//  Accessibility
//
//  Created by Jacob Andrean on 02/09/21.
//

import SwiftUI

struct IntroductionViewExample: View {
    let pictures = [
        "ales-krivec-15949",
        "galina-n-189483",
        "kevin-horstmann-141705",
        "nicolas-tissot-335096"
    ]
    
    let labels = [
        "Tulips",
        "Frozen tree buds",
        "Sunflowers",
        "Fireworks"
    ]
    
    @State private var selectedPicture = Int.random(in: 0...3)
    
    var body: some View {
        Image(pictures[selectedPicture])
            .resizable()
            .scaledToFit()
            .accessibilityLabel(Text(labels[selectedPicture]))
            .accessibility(addTraits: .isButton)
            .accessibility(removeTraits: .isImage)
            .onTapGesture {
                self.selectedPicture = Int.random(in: 0...3)
            }
    }
}

struct HidingGroupAccessibilityExample: View {
    var body: some View {
        VStack {
            Text("Your score is")
            Text("1000")
                .font(.title)
        }
//        .accessibilityElement(children: .combine)
        .accessibilityElement(children: .ignore)
        .accessibility(label: Text("Your score is 1000"))
    }
}

struct ReadingValueOfControlExample: View {
    @State private var estimate = 25.0
    @State private var rating = 3
    
    var body: some View {
        VStack {
            Slider(value: $estimate, in: 0...50)
                .padding()
                .accessibility(value: Text("\(Int(estimate))"))
            
            Stepper("Rate our service: \(rating)/5", value: $rating, in: 1...5)
                .accessibility(value: Text("\(rating) out of 5"))
        }
    }
}
