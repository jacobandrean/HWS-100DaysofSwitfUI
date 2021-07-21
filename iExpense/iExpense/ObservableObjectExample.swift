//
//  ObservableObjectExample.swift
//  iExpense
//
//  Created by Jacob Andrean on 21/07/21.
//

import SwiftUI

class User: ObservableObject {
    @Published var firstName = "Bilbo"
    @Published var lastName = "Bagins"
}

struct ObservableObjectExample: View {
    @ObservedObject private var user = User()
    @State private var showingSheet = false
    
    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName)")
            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
            Button("Show second screen") {
                showingSheet.toggle()
            }
            .sheet(isPresented: $showingSheet, content: {
                ContentView2(firstName: user.firstName, lastName: user.lastName)
            })
        }
    }
}

struct ContentView2: View {
    @Environment(\.presentationMode) var presentationMode
    
    let firstName: String
    let lastName: String
    
    var body: some View {
        VStack {
            Text("Your name is \(firstName) \(lastName)")
            Button("Dismiss") {
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

struct ObservableObjectExample_Previews: PreviewProvider {
    static var previews: some View {
        ObservableObjectExample()
    }
}
