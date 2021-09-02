//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Jacob Andrean on 26/06/21.
//

import SwiftUI

struct FlagImage: View {
    let image: String
    let animationAmount: Double
    let isCorrect: Bool
    let offsetValue: CGFloat
    
    var body: some View {
        Image(image)
            .renderingMode(.original)
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
            .shadow(color: .black, radius: 2)
            .rotation3DEffect(
                .degrees(isCorrect ? animationAmount : 0),
                axis: (x: 0.0, y: 1.0, z: 0.0)
            )
            .offset(x: isCorrect ? 0 : offsetValue)
    }
}

struct GuessTheFlagView: View {
    let labels = [
        "Estonia": "Flag with thre horizontal stripes of equal size. Top stripe blue, middle strope black, bottom stripe white",
        "France": "Flag with thre vertical stripes of equal size. Top stripe blue, middle strope black, bottom stripe white"
    ]
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var score = 0
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    @State private var animationAmount = 0.0
    @State private var opacityIsAllowed = false
    @State private var offsetValue: CGFloat = 0
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                
                ForEach(0..<3) { number in
                    Button(action: {
                        self.flagTapped(number)
                        if number == correctAnswer {
                            withAnimation {
                                self.animationAmount += 360
                                self.opacityIsAllowed = true
                            }
                        } else {
                            withAnimation(.default.repeatCount(5)) {
                                self.offsetValue = 10
                            }
                        }
                    }) {
                        FlagImage(image: self.countries[number], animationAmount: animationAmount, isCorrect: number == correctAnswer, offsetValue: offsetValue)
                            .accessibility(label: Text(self.labels[self.countries[number], default: "Unknown flag"]))
                    }
                    .opacity(number != correctAnswer && opacityIsAllowed ? 0.25 : 1)
                }
                
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.footnote)
                Spacer()
            }
        }
        .alert(isPresented: $showingScore, content: {
            Alert(title: Text(scoreTitle), message: Text("Your score is \(score)"), dismissButton: .default(Text("Continue")) {
                opacityIsAllowed = false
                offsetValue = 0
                self.askQuestion()
            })
        })
    }
    
    func flagTapped(_ number: Int) {
//        scoreTitle = number == correctAnswer ? "Correct" : "Wrong"
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 10
        } else {
            scoreTitle = "Wrong! That's the flag of \(countries[number])"
            score -= 5
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            showingScore = true
        }
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct GuessTheFlagView_Previews: PreviewProvider {
    static var previews: some View {
        GuessTheFlagView()
    }
}
