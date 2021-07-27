//
//  Movie+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Jacob Andrean on 28/07/21.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var director: String?
    @NSManaged public var title: String?
    @NSManaged public var year: Int16

    public var wrappedTitle: String {
        return title ?? "Unknown title"
    }
    
    public var wrappedDirector: String {
        return director ?? "Unknown director"
    }
}

extension Movie : Identifiable {

}
