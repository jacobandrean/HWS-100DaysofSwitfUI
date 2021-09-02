//
//  ResultTypeExample.swift
//  HotProspects
//
//  Created by Jacob Andrean on 02/09/21.
//

import SwiftUI

enum NetworkError: Error {
    case badURL, requestFailed, unknown
}

struct ResultTypeExample: View {
    var body: some View {
        Text("Hello, world!")
            .onAppear {
                self.fetchData(from: "https://www.apple.com") { result in
                    switch result {
                    case .success(let str):
                        print(str)
                    case .failure(let error):
                        switch error {
                        case .badURL:
                            print("Bad URL")
                        case .requestFailed:
                            print("Request Failed")
                        case .unknown:
                            print("Unknown Error")
                        }
                    }
                }
            }
    }
    
    func fetchData(from urlString: String, completion: @escaping (Result<String, NetworkError>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(.badURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                let stringData = String(decoding: data, as: UTF8.self)
                completion(.success(stringData))
            }
            else if error != nil {
                completion(.failure(.requestFailed))
            }
            else {
                completion(.failure(.unknown))
            }
        }
        .resume()
    }
}
