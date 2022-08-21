//
//  TaskEntity+CoreDataProperties.swift
//  Tasky
//
//  Created by Yersultan Nalikhan on 22.08.2022.
//
//

import Foundation
import CoreData


extension TaskEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TaskEntity> {
        return NSFetchRequest<TaskEntity>(entityName: "TaskEntity")
    }

    @NSManaged public var date: Date?
    @NSManaged public var status: Bool
    @NSManaged public var title: String
    @NSManaged public var taskID: UUID

}

extension TaskEntity : Identifiable {

}
