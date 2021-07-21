//
//  ContentView.swift
//  Edutainment
//
//  Created by Jacob Andrean on 10/07/21.
//

import SwiftUI

struct Multiplication: Hashable {
    let first: Int
    let second: Int
    let answer: Int
    
    init(first: Int, second: Int) {
        let randomInt = Int.random(in: 0...1)
        if randomInt == 0 {
            self.first = first
            self.second = second
        } else {
            self.first = second
            self.second = first
        }
        self.answer = first*second
    }
}

struct EdutainmentView: View {
    @State private var isRunning = false
    @State private var multiplyBy = 1
    @State private var numberOfQuestion = "5"
    
    let numberOfQuestions = ["5", "10", "20", "All"]
    
    var questions: [Multiplication] {
        var numbers = Set<Multiplication>()
        while numbers.count < Int(numberOfQuestion) ?? 23 {
            numbers.insert(Multiplication(first: multiplyBy, second: Int.random(in: 1...12)))
        }
        return Array(numbers)
    }
    
    var body: some View {
        Form {
            Section {
                HStack {
                    Spacer()
                    Text("Setting")
                    Spacer()
                }
            }

            Section(header: Text("Which Multiplications?")) {
                Stepper(value: $multiplyBy, in: 1...12, step: 1) {
                    Text("\(multiplyBy)")
                }
            }
            
            Section(header: Text("How many questions?")) {
                Picker("How many questions?", selection: $numberOfQuestion) {
                    ForEach(numberOfQuestions, id: \.self) { num in
                        Text(num)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Button(action: {
                isRunning = true
            }, label: {
                HStack {
                    Spacer()
                    Text("Start")
                    Spacer()
                }
            })
            
            ForEach(questions, id:\.self) { num in
                Text("\(num.first) * \(num.second) = \(num.answer)")
            }
        }
        .fullScreenCover(isPresented: $isRunning) {
            GameView(isRunning: $isRunning, questions: questions)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
//        EdutainmentView()
        GameView(isRunning: .constant(true), questions: [Multiplication(first: 2, second: 4)])
    }
}

struct GameView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var isRunning: Bool
    let questions: [Multiplication]
    @State private var answer = ""
    @State private var index = 0
    @State private var score = 0
    
    var body: some View {
        Form {
            Text("\(questions[index].first) * \(questions[index].second) = \(questions[index].answer)")
            TextField("Answer", text: $answer)
            Button("Next") {
                if answer == "\(questions[index].answer)" {
                    score += 1
                }
                if index < questions.count-1 {
                    index += 1
                } else {
                    isRunning = false
                }
            }
            Text("\(score)")
//            Button("Dismiss") {
//                presentationMode.wrappedValue.dismiss()
//                isRunning = false
//            }
        }
    }
}
