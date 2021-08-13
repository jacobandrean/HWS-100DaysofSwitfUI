//
//  ContentView.swift
//  FriendFace
//
//  Created by Jacob Andrean on 08/08/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ViewModel()
    var body: some View {
        NavigationView {
            List {
                Text("count: \(viewModel.users.count)")
                ForEach(viewModel.users, id: \.id) { user in
                    NavigationLink(destination: DetailView(viewModel: viewModel, user: user)) {
                        Text(user.name)
                    }
                }
            }
            .navigationTitle("Friend Face")
        }
        .onAppear(perform: viewModel.onAppear)
    }
}

struct DetailView: View {
    @ObservedObject var viewModel: ViewModel
    let user: User
    var body: some View {
        Form {
            Section {
                HStack {
                    Text(user.name)
                    Text("(\(user.age))")
                    Text("at \(user.company)")
                }
                Text(user.email)
            }
            
            Section(header: Text("About")) {
                Text(user.about)
            }
            
            Section(header: Text("Friends")) {
                ForEach(user.friends, id: \.id) { friend in
                    NavigationLink(destination: DetailView(viewModel: viewModel, user: self.getUser(id: friend.id))) {
                        Text(friend.name)
                    }
                }
            }
        }
    }
    
    func getUser(id: String) -> User {
        return viewModel.users.first(where: { $0.id == id}) ?? User(id: "", isActive: false, name: "", age: 0, company: "", email: "", address: "", about: "", registered: "", tags: [], friends: [])
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


