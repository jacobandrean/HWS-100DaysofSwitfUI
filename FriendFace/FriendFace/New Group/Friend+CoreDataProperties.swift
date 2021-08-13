//
//  Friend+CoreDataProperties.swift
//  FriendFace
//
//  Created by Jacob Andrean on 13/08/21.
//
//

import Foundation
import CoreData


extension Friend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Friend> {
        return NSFetchRequest<Friend>(entityName: "Friend")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?

}

extension Friend : Identifiable {

}
