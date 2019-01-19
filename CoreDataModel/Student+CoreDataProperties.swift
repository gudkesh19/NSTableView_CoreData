//
//  Student+CoreDataProperties.swift
//  StudentsList
//
//  Created by Gudkesh Kumar on 10/01/19.
//  Copyright © 2019 Exilant. All rights reserved.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var rollNumber: Int32
    @NSManaged public var name: String?
    @NSManaged public var address: String?

}
