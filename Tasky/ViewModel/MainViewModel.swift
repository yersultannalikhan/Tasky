//
//  ViewModel.swift
//  Tasky
//
//  Created by Yersultan Nalikhan on 18.08.2022.
//

import Foundation
import UIKit

class MainViewModel: MainViewModelType {
    var array: [TaskEntity]
    var selectedIndexPath: IndexPath? = nil
    
    init() {
        array = TaskData.getTasks().sorted(by: { task1, task2 in
            return !task1.status && task2.status
        })
    }
    
    func numberOfRows() -> Int {
        return array.count
    }
    
    func viewModelForCellForRowAt(indexPath: IndexPath) -> CellViewModelType? {
        return CellViewModel(task: array[indexPath.row])
    }
    
    func didSelectRowAt(indexPath: IndexPath) {
        selectedIndexPath = indexPath
    }
    
    func viewModelForSelectedRow() -> NewTaskViewModelType? {
        guard let selectedIndexPath = selectedIndexPath else { return nil }
        return NewTaskViewModel(task: array[selectedIndexPath.row])
    }
    
    func removeTask(indexPath: IndexPath, completionHandler : @escaping () -> Void) {
        AppDelegate.sharedAppDelegate.coreDataStack.managedContext.delete(self.array[indexPath.row])
        self.array.remove(at: indexPath.row)
        AppDelegate.sharedAppDelegate.coreDataStack.saveContext()
        completionHandler()
    }
    
    func textForLeadingSwipe(indexPath: IndexPath) -> String {
        let task = array[indexPath.row]
        return task.status ? "Undone" : "Done"
    }
    
    func textColorForLeadingSwipe(indexPath: IndexPath) -> UIColor {
        let task = array[indexPath.row]
        return task.status ? UIColor.systemRed : UIColor.systemBlue
    }
    
    func indexPathForLeadingSwipe(indexPath: IndexPath) -> IndexPath {
        let task = array[indexPath.row]
        return task.status ?  IndexPath(row: (numberOfRows() - 1) , section: 0) : IndexPath(row: 0, section: 0)
    }
    
    func statusChangedViewModelForCellForRowAt(indexPath: IndexPath) -> CellViewModelType? {
        let task = array[indexPath.row]
        task.status = !task.status
        return CellViewModel(task: task)
    }
    
    func changeStatusOfTask(from: IndexPath) {
        let fromTask = self.array[from.row]
        
        if fromTask.status == true {
            array.remove(at: from.row)
            array.append(fromTask)
        } else {
            array.remove(at: from.row)
            array.insert(fromTask, at: 0)
        }
        
        AppDelegate.sharedAppDelegate.coreDataStack.managedContext.insert(fromTask)
        AppDelegate.sharedAppDelegate.coreDataStack.saveContext()
        
    }
}
