//
//  NewViewModel.swift
//  Tasky
//
//  Created by Yersultan Nalikhan on 21.08.2022.
//

import Foundation

enum NewTaskCreationType {
    case create, insert
}

class NewTaskViewModel: NewTaskViewModelType {
    
    var title: String {
        return task?.title ?? "empty"
    }

    var date: Date? {
        return task?.date
    }
    
    var dateString: String? {
        if let date = task?.date {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd MMMM yyyy"
            return dateFormatter.string(from: date)
        }
        return nil
    }
    
    var newTaskCreationType: NewTaskCreationType
    
    private var task: TaskEntity?
    
    init(task: TaskEntity){
        self.task = task
        self.newTaskCreationType = .insert
    }
    
    init() {
        self.newTaskCreationType = .create
    }
    
    func createTask(title: String, date: Date?, completionHandler: @escaping () -> Void) {
        let managedContext = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
        let newTask = TaskEntity(context: managedContext)
        newTask.setValue(title, forKey: #keyPath(TaskEntity.title))
        newTask.setValue(false, forKey: #keyPath(TaskEntity.status))
        newTask.setValue(UUID(), forKey: #keyPath(TaskEntity.taskID))
        if let date = date {
            newTask.setValue(date, forKey: #keyPath(TaskEntity.date))
        } else {
            newTask.setNilValueForKey(#keyPath(TaskEntity.date))
        }
        AppDelegate.sharedAppDelegate.coreDataStack.saveContext()
        completionHandler()
    }
    
    func insertTask(title: String, date: Date?, completionHandler: @escaping () -> Void) {
        guard let task = task else { return }
        task.setValue(title, forKey: #keyPath(TaskEntity.title))
        if let date = date {
            task.setValue(date, forKey: #keyPath(TaskEntity.date))
        } else {
            task.setNilValueForKey(#keyPath(TaskEntity.date))
        }
        AppDelegate.sharedAppDelegate.coreDataStack.managedContext.insert(task)
        AppDelegate.sharedAppDelegate.coreDataStack.saveContext()
        completionHandler()
    }
    
    
}
