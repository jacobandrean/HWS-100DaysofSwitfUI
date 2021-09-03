//
//  TapGestureHitTesting.swift
//  Flashzilla
//
//  Created by Jacob Andrean on 03/09/21.
//

import SwiftUI

struct TapGestureHitTesting: View {
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: 300, height: 300, alignment: .center)
                    .onTapGesture {
                        print("Rectangle tapped!")
                    }
                
                Circle()
                    .fill(Color.red)
                    .frame(width: 300, height: 300, alignment: .center)
//                    .contentShape(Rectangle())
                    .onTapGesture {
                        print("Circle tapped!")
                    }
//                    .allowsHitTesting(false)
            }
            
            Spacer()
            
            VStack {
                Text("Hello")
                Spacer().frame(height: 100)
                Text("World")
            }
            .contentShape(Rectangle())
            .onTapGesture {
                print("Vstack tapped!")
            }
        }
    }
}
