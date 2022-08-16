//
//  TaskEntity+CoreDataProperties.swift
//  Tasky
//
//  Created by Yersultan Nalikhan on 17.08.2022.
//
//

import Foundation
import CoreData
import UIKit


extension TaskEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TaskEntity> {
        return NSFetchRequest<TaskEntity>(entityName: "TaskEntity")
    }

    @NSManaged public var title: String?
    @NSManaged public var date: Date?
    @NSManaged public var status: Bool

}

extension TaskEntity : Identifiable {

}
