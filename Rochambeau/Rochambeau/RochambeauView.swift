//
//  ContentView.swift
//  Rochambeau
//
//  Created by Jacob Andrean on 27/06/21.
//

import SwiftUI

struct RochambeauView: View {
    let moves = ["rock", "paper", "scissors"]
    @State private var currentChoice = Int.random(in: 0...2)
    @State private var shouldWin = Bool.random()
    @State private var score = 0
    @State private var counter = 1
    @State private var showAlert = false
    var body: some View {
        VStack {
            Text("Game \(counter)/10")
                .padding(10)
            Text("Score: \(score)")
                .padding(.bottom, 30)
//            Text("App move: \(moves[currentChoice])")
            Image(moves[currentChoice])
                .padding(30)
                .background(Color.red)
                .clipShape(Circle())
//            Text("You should \(shouldWin ? "win" : "lose")")
            Text("\(shouldWin ? "Lose" : "Win") against?")
                .font(.largeTitle)
                .padding(50)
            HStack(spacing: 20) {
                ForEach(moves, id: \.self) { move in
                    Button(action: {
                        countScore(for: move)
                        nextGame()
                    }) {
                        Image(move)
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width/4-30, height: UIScreen.main.bounds.width/4-30)
                            .padding()
                            .background(Color.blue)
                            .clipShape(Circle())
                    }
                }
            }
            Spacer()
        }
        .alert(isPresented: $showAlert, content: {
            Alert(title: Text("Your score: \(score)"), message: Text(""), dismissButton: .default(Text("New Game")){
                score = 0
                counter = 1
            })
        })
    }
    
    func nextGame() {
        guard counter < 10 else {
            showAlert = true
            return
        }
        currentChoice = Int.random(in: 0...2)
        shouldWin = Bool.random()
        counter+=1
    }
    
    func countScore(for move: String) {
        if shouldWin {
            switch moves[currentChoice] {
            case "rock":
                if move == "paper" {
                    score+=1
                } else {
                    score-=1
                }
            case "paper":
                if move == "scissors" {
                    score+=1
                } else {
                    score-=1
                }
            case "scissors":
                if move == "rock" {
                    score+=1
                } else {
                    score-=1
                }
            default:
                break
            }
        } else {
            switch moves[currentChoice] {
            case "rock":
                if move == "scissors" {
                    score+=1
                } else {
                    score-=1
                }
            case "paper":
                if move == "rock" {
                    score+=1
                } else {
                    score-=1
                }
            case "scissors":
                if move == "paper" {
                    score+=1
                } else {
                    score-=1
                }
            default:
                break
            }
        }
    }
}

struct RochambeauView_Previews: PreviewProvider {
    static var previews: some View {
        RochambeauView()
    }
}
