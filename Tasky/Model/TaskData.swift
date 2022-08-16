//
//  TaskData.swift
//  Tasky
//
//  Created by Yersultan Nalikhan on 16.08.2022.
//

import Foundation
import CoreData

class TaskData {
    var title: String
    var date: Date?
    var status: Bool
    
    init(title: String, date: Date?, status: Bool) {
        self.title = title
        self.date = date
        self.status = status
    }
    
    static func getTasks() -> [TaskEntity] {
        var array = [TaskEntity]()
        let taskFetch: NSFetchRequest<TaskEntity> = TaskEntity.fetchRequest()
        do {
            let managedContext = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
            let results = try managedContext.fetch(taskFetch)
            array = results
        } catch let error as NSError {
            print("Fetch error: \(error) description: \(error.userInfo)")
        }
        return array
    }
}
