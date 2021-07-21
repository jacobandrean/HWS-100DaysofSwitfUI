//
//  ArchivingSwiftObjectExample.swift
//  iExpense
//
//  Created by Jacob Andrean on 21/07/21.
//

import SwiftUI

struct User2: Codable {
    var firstName: String
    var lastName: String
}

struct ArchivingSwiftObjectExample: View {
    @State private var user = User2(firstName: "Jacob", lastName: "Andrean")
    @State private var user2 = User2(firstName: "", lastName: "")
    var body: some View {
        Button("Save user") {
            let encoder = JSONEncoder()
            
            if let data = try? encoder.encode(user) {
                UserDefaults.standard.set(data, forKey: "UserData")
            }
        }
        
        Button("decode user") {
            let decoder = JSONDecoder()
            
            if let data = UserDefaults.standard.data(forKey: "UserData") {
                if let user2 = try? decoder.decode(User2.self, from: data) {
                    self.user2 = user2
                }
            }
        }
        
        Text("\(user2.firstName) - \(user2.lastName)")
    }
}

struct ArchivingSwiftObjectExample_Previews: PreviewProvider {
    static var previews: some View {
        ArchivingSwiftObjectExample()
    }
}
