//
//  SwiftUIView.swift
//  CoreDataProject
//
//  Created by Jacob Andrean on 28/07/21.
//

import CoreData
import SwiftUI

struct FetchRequestNSPredicateExample: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Ship.entity(), sortDescriptors: [], predicate: NSPredicate(format: "universe == %@", "Star Wars")) var ships: FetchedResults<Ship>
    ///https://www.hackingwithswift.com/books/ios-swiftui/filtering-fetchrequest-using-nspredicate
    
    var body: some View {
        VStack {
            List(ships, id: \.self) { ship in
                Text(ship.name ?? "Unknown name")
            }
            
            Button("Add Examples") {
                let ship1 = Ship(context: self.moc)
                ship1.name = "Enterprise"
                ship1.universe = "Star Trek"
                
                let ship2 = Ship(context: self.moc)
                ship2.name = "Defiant"
                ship2.universe = "Star Trek"
                
                let ship3 = Ship(context: self.moc)
                ship3.name = "Millennium Falcon"
                ship3.universe = "Star Trek"
                
                let ship4 = Ship(context: self.moc)
                ship4.name = "Executor"
                ship4.universe = "Star Wars"
                
                try? self.moc.save()
            }
        }
    }
}

struct FetchRequestNSPredicateExample_Previews: PreviewProvider {
    static var previews: some View {
        FetchRequestNSPredicateExample()
    }
}
