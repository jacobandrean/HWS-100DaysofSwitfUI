//
//  WrappedPropertyCodable.swift
//  CupcakeCorner
//
//  Created by Jacob Andrean on 26/07/21.
//

import SwiftUI

class User: ObservableObject, Codable {
    enum CodingKeys: CodingKey {
        case name
    }
    
    @Published var name = "Jacob Andrean"
    
    // can drop the required but make the class final (final class User)
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
}

struct WrappedPropertyCodableExample: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct WrappedPropertyCodableExample_Previews: PreviewProvider {
    static var previews: some View {
        WrappedPropertyCodableExample()
    }
}
