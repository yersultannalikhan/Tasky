//
//  MainView+DataSource.swift
//  Tasky
//
//  Created by Yersultan Nalikhan on 16.08.2022.
//

import UIKit
import CoreData

protocol NewTaskDelegate {
    func addTask(task: TaskData)
}

extension MainController: UITableViewDataSource, NewTaskDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        let task = taskArray[indexPath.row]
        cell.textLabel?.text = task.title
        if let taskDate = task.date {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd MMMM yyyy"
            cell.detailTextLabel?.text = dateFormatter.string(from: taskDate)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskArray.count
    }
    
    func addTask(task: TaskData) {
        let managedContext = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
        let newTask = TaskEntity(context: managedContext)
        newTask.setValue(task.title, forKey: #keyPath(TaskEntity.title))
        newTask.setValue(task.status, forKey: #keyPath(TaskEntity.status))
        if let taskDate = task.date {
            newTask.setValue(taskDate, forKey: #keyPath(TaskEntity.date))
        } else {
            newTask.setNilValueForKey(#keyPath(TaskEntity.date))
        }
        self.taskArray.append(newTask)
        AppDelegate.sharedAppDelegate.coreDataStack.saveContext() // Save changes in CoreData
                   
        DispatchQueue.main.async {
            self.mainView.tableView.reloadData()
        }
    }

}
