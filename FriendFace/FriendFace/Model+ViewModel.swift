//
//  Model+ViewModel.swift
//  FriendFace
//
//  Created by Jacob Andrean on 08/08/21.
//

import Foundation

struct User: Codable {
    let id: String
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: String
    let tags: [String]
    let friends: [Friend]
}

struct Friend: Codable {
    let id: String
    let name: String
}

class ViewModel: ObservableObject {
    @Published var users = [User]()
    
    func onAppear() {
        fetchUsers()
    }
    
    private func fetchUsers() {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode([User].self, from: data) {
                    DispatchQueue.main.async {
                        self.users = decodedResponse
                    }
                    return
                }
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown Error")")
        }
        .resume()
    }
}
