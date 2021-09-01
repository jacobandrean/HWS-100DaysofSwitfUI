//
//  AddingConformancetoComparableExample.swift
//  BucketList
//
//  Created by Jacob Andrean on 14/08/21.
//

import SwiftUI

struct User: Identifiable, Comparable {
    let id = UUID()
    let firstName: String
    let lastName: String
    
    static func <(lhs: User, rhs: User) -> Bool {
        lhs.lastName < rhs.lastName
    }
}

struct AddingConformancetoComparableExample: View {
    let values = [1, 5, 3, 6, 2, 9].sorted()
    
    let users = [
        User(firstName: "Jacob", lastName: "Andrean"),
        User(firstName: "Rea", lastName: "Debora"),
        User(firstName: "Kristianty", lastName: "Reanjac")
    ].sorted()
    
    var body: some View {
//        List(values, id: \.self) {
//            Text(String($0))
//        }
        
        List(users) { user in
            Text("\(user.firstName), \(user.lastName)")
        }
    }
}

struct AddingConformancetoComparableExample_Previews: PreviewProvider {
    static var previews: some View {
        AddingConformancetoComparableExample()
    }
}
