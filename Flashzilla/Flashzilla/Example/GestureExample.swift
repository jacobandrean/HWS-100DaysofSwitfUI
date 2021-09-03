//
//  GestureExample.swift
//  Flashzilla
//
//  Created by Jacob Andrean on 03/09/21.
//

import SwiftUI

struct CombinedGestureExample: View {
    @State private var offset = CGSize.zero
    @State private var isDragging = false
    
    var body: some View {
        let dragGesture = DragGesture()
            .onChanged { value in
                self.offset = value.translation
            }
            .onEnded { _ in
                withAnimation {
                    self.offset = .zero
                    self.isDragging = false
                }
            }
        
        let pressGesture = LongPressGesture()
            .onEnded { value in
                withAnimation {
                    self.isDragging = true
                }
            }
        
        let combined = pressGesture.sequenced(before: dragGesture)
        
        return Circle()
            .fill(Color.red)
            .frame(width: 64, height: 64, alignment: .center)
            .scaleEffect(isDragging ? 1.5 : 1)
            .offset(offset)
            .gesture(combined)
            
    }
}

struct GestureExample1: View {
    @State private var currentAmount: CGFloat = 0
    @State private var finalAmount: CGFloat = 1
    
    @State private var currentAngle: Angle = .degrees(0)
    @State private var finalAngle: Angle = .degrees(0)
    
    var body: some View {
        VStack {
            Text("Hello, world!")
                .onTapGesture {
                    print("Text tapped")
                }
        }
        .simultaneousGesture(
            TapGesture()
                .onEnded { _ in
                    print("Vstack tapped")
                }
        )
//        .highPriorityGesture(
//            TapGesture()
//                .onEnded { _ in
//                    print("Vstack tapped")
//                }
//        )
//            .scaleEffect(finalAmount + currentAmount)
//            .gesture(
//                MagnificationGesture()
//                    .onChanged({ amount in
//                        self.currentAmount = amount - 1
//                    })
//                    .onEnded({ amount in
//                        self.finalAmount += self.currentAmount
//                        self.currentAmount = 0
//                    })
//            )
//            .rotationEffect(finalAngle + currentAngle)
//            .gesture(
//                RotationGesture()
//                    .onChanged({ angle in
//                        self.currentAngle = angle
//                    })
//                    .onEnded({ angle in
//                        self.finalAngle += self.currentAngle
//                        self.currentAngle = .degrees(0)
//                    })
//            )
//
//            .onTapGesture(count: 2, perform: {
//                print("Double tapped!" )
//            })
//            .onLongPressGesture(minimumDuration: 1, pressing: { inProgress in
//                print("In progress: \(inProgress)")
//            }, perform: {
//                print("Long pressed!")
//            })
    }
}
