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
    let location: Location?
    
    static func < (lhs: Person, rhs: Person) -> Bool {
        lhs.name < rhs.name
    }
}

struct Location: Codable, Hashable {
    let latitude: Double
    let longitude: Double
}
