//
//  Order.swift
//  CupcakeCorner
//
//  Created by Jacob Andrean on 26/07/21.
//

import Foundation

struct OrderModel: Codable {
    var type = 0
    var quantity = 3
    
    var extraFrosting = false
    var addSpringkles = false
    
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
}

class Order: ObservableObject {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    @Published var orderViewModel = OrderModel()
    
    @Published var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                orderViewModel.extraFrosting = false
                orderViewModel.addSpringkles = false
            }
        }
    }
    
    var hasValidAddress: Bool {
        if orderViewModel.name.isEmpty || orderViewModel.name.isBlank || orderViewModel.streetAddress.isEmpty || orderViewModel.streetAddress.isBlank || orderViewModel.city.isEmpty || orderViewModel.city.isBlank || orderViewModel.zip.isEmpty || orderViewModel.zip.isBlank {
            return false
        }
        return true
    }
    
    var cost: Double {
        var cost = Double(orderViewModel.quantity) * 2
        cost += Double(orderViewModel.type) / 2
        
        if orderViewModel.extraFrosting {
            cost += Double(orderViewModel.quantity)
        }
        
        if orderViewModel.addSpringkles {
            cost += Double(orderViewModel.quantity) / 2
        }
        
        return cost
    }
    
}

//class Order: ObservableObject, Codable {
//    enum CodingKeys: CodingKey {
//        case type, quantity, extraFrosting, addSpringkles, name, streetAddress, city, zip
//    }
//
//    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
//
//    @Published var type = 0
//    @Published var quantity = 3
//
//    @Published var specialRequestEnabled = false {
//        didSet {
//            if specialRequestEnabled == false {
//                extraFrosting = false
//                addSpringkles = false
//            }
//        }
//    }
//
//    @Published var extraFrosting = false
//    @Published var addSpringkles = false
//
//    @Published var name = ""
//    @Published var streetAddress = ""
//    @Published var city = ""
//    @Published var zip = ""
//
//    var hasValidAddress: Bool {
//        if name.isEmpty || name.isBlank || streetAddress.isEmpty || streetAddress.isBlank || city.isEmpty || city.isBlank || zip.isEmpty || zip.isBlank {
//            return false
//        }
//        return true
//    }
//
//    var cost: Double {
//        var cost = Double(quantity) * 2
//        cost += Double(type) / 2
//
//        if extraFrosting {
//            cost += Double(quantity)
//        }
//
//        if addSpringkles {
//            cost += Double(quantity) / 2
//        }
//
//        return cost
//    }
//
//    init() {}
//
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//
//        type = try container.decode(Int.self, forKey: .type)
//        quantity = try container.decode(Int.self, forKey: .quantity)
//
//        extraFrosting = try container.decode(Bool.self, forKey: .extraFrosting)
//        addSpringkles = try container.decode(Bool.self, forKey: .addSpringkles)
//
//        name = try container.decode(String.self, forKey: .name)
//        streetAddress = try container.decode(String.self, forKey: .streetAddress)
//        city = try container.decode(String.self, forKey: .city)
//        zip = try container.decode(String.self, forKey: .zip)
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//
//        try container.encode(type, forKey: .type)
//        try container.encode(quantity, forKey: .quantity)
//
//        try container.encode(extraFrosting, forKey: .extraFrosting)
//        try container.encode(addSpringkles, forKey: .addSpringkles)
//
//        try container.encode(name, forKey: .name)
//        try container.encode(streetAddress, forKey: .streetAddress)
//        try container.encode(city, forKey: .city)
//        try container.encode(zip, forKey: .zip)
//    }
//
//}

extension String {
    var isBlank: Bool {
        return allSatisfy({$0.isWhitespace})
    }
}
