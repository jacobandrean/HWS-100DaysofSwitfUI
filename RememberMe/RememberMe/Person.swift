//
//  Person.swift
//  RememberMe
//
//  Created by Jacob Andrean on 02/09/21.
//

import Foundation

struct Person: Codable, Hashable, Comparable {
    var id = UUID()
    let name: String
    let imageData: Data
    
    static func < (lhs: Person, rhs: Person) -> Bool {
        lhs.name < rhs.name
    }
}
