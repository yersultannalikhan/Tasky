//
//  NewViewModel.swift
//  Tasky
//
//  Created by Yersultan Nalikhan on 21.08.2022.
//

import Foundation

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
    
   
    private var task: TaskEntity?
    var indexOfTask: Int?
    
    init(task: TaskEntity){
        self.task = task
    }
    
    init() {
        
    }
    
}
