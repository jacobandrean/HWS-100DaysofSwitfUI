//
//  SwiftUIView.swift
//  CoreDataProject
//
//  Created by Jacob Andrean on 28/07/21.
//

import SwiftUI

struct DynamicFilterExample: View {
    @Environment(\.managedObjectContext) var moc
    @State private var lastNameFilter = "A"
    
    var body: some View {
        VStack {
            
//            FilteredList(filter: lastNameFilter)
//            FilteredList(filterKey: "lastName", filterValue: lastNameFilter) { (singer: Singer) in
//                Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
//            }
            FilteredList(sortDescriptors: [NSSortDescriptor(keyPath: \Singer.firstName, ascending: true)], filterKey: "lastName", predicate: .beginsWith, filterValue: lastNameFilter) { (singer: Singer) in
                Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
            }
            
            Button("Add Examples") {
                let taylor = Singer(context: self.moc)
                taylor.firstName = "Taylor"
                taylor.lastName = "Swift"
                
                let ed = Singer(context: self.moc)
                ed.firstName = "Ed"
                ed.lastName = "Sheeran"
                
                let adele = Singer(context: self.moc)
                adele.firstName = "Adele"
                adele.lastName = "Adkins"
                
                try? self.moc.save()
            }
            
            Button("Show A") {
                self.lastNameFilter = "A"
            }
            
            Button("Show S") {
                self.lastNameFilter = "S"
            }
        }
    }
}

struct DynamicFilterExample_Previews: PreviewProvider {
    static var previews: some View {
        DynamicFilterExample()
    }
}
