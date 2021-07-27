//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Jacob Andrean on 28/07/21.
//

import SwiftUI

struct Student: Hashable {
    let name: String
}

struct HashableExample: View {
    let students = [
        Student(name: "Harry Potter"),
        Student(name: "Harry Potter"),
        Student(name: "Hermione Granger")
    ]
    
    var body: some View {
        List(students, id: \.self) { student in
            Text(student.name)
        }
    }
}

struct HashableExample_Previews: PreviewProvider {
    static var previews: some View {
        HashableExample()
    }
}
