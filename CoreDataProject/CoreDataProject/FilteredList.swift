//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Jacob Andrean on 28/07/21.
//

import CoreData
import SwiftUI

//struct FilteredList: View {
//    var fetchRequest: FetchRequest<Singer>
//    var singers: FetchedResults<Singer> {
//        fetchRequest.wrappedValue
//    }
//
//    var body: some View {
//        List(singers, id: \.self) { singer in
//            Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
//        }
//    }
//
//    init(filter: String) {
//        fetchRequest = FetchRequest<Singer>(entity: Singer.entity(), sortDescriptors: [], predicate: NSPredicate(format: "lastName BEGINSWITH %@", filter))
//    }
//}

//struct FilteredList<T: NSManagedObject, Content: View>: View {
//    var fetchRequest: FetchRequest<T>
//    var singers: FetchedResults<T> {
//        fetchRequest.wrappedValue
//    }
//    let content: (T) -> Content
//
//    var body: some View {
//        List(singers, id: \.self) { singer in
//            self.content(singer)
//        }
//    }
//
//    init(filterKey: String, filterValue: String, @ViewBuilder content: @escaping (T) -> Content) {
//        fetchRequest = FetchRequest<T>(entity: T.entity(), sortDescriptors: [], predicate: NSPredicate(format: "%K BEGINSWITH %@", filterKey, filterValue))
//        self.content = content
//    }
//}

enum Predicate: String {
    case beginsWith = "BEGINSWITH"
}

struct FilteredList<T: NSManagedObject, Content: View>: View {
    var fetchRequest: FetchRequest<T>
    var singers: FetchedResults<T> {
        fetchRequest.wrappedValue
    }
    let content: (T) -> Content
    
    var body: some View {
        List(singers, id: \.self) { singer in
            self.content(singer)
        }
    }
    
    init(
        sortDescriptors: [NSSortDescriptor],
        filterKey: String,
        predicate: Predicate,
        filterValue: String,
        @ViewBuilder content: @escaping (T) -> Content
    ) {
        fetchRequest = FetchRequest<T>(
            entity: T.entity(),
            sortDescriptors: sortDescriptors,
            predicate: NSPredicate(format: "%K \(predicate.rawValue) %@", filterKey, filterValue)
        )
        self.content = content
    }
}

//struct FilteredList_Previews: PreviewProvider {
//    static var previews: some View {
//        FilteredList(filter: "A")
//        FilteredList(filterKey: "lastName", filterValue: "A") { (singer: Singer) in
//            Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
//        }
//    }
//}
