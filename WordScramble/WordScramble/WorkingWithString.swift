//
//  WorkingWithString.swift
//  WordScramble
//
//  Created by Jacob Andrean on 02/07/21.
//

import SwiftUI

struct WorkingWithString: View {
    var body: some View {
//        let input = """
//                    a
//                    b
//                    c
//                    """
//        let letters = input.components(separatedBy: "\n")
//        let letter = letters.randomElement() ?? ""
//        let trimmed = letter.trimmingCharacters(in: .whitespaces)
        
        let word = "swift"
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        let allGood = misspelledRange.location == NSNotFound
        Text("Hello, world!")
            .padding()
    }
}

struct WorkingWithString_Previews: PreviewProvider {
    static var previews: some View {
        WorkingWithString()
    }
}
