//
//  CellViewModel.swift
//  Tasky
//
//  Created by Yersultan Nalikhan on 21.08.2022.
//

import Foundation

class CellViewModel: CellViewModelType {
    
    private var task: TaskEntity
    
    var title: String {
        return task.title
    }
    
    var status: Bool {
        return task.status
    }
    
    var dateString: String? {
        if let date = task.date {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd MMMM yyyy"
            return dateFormatter.string(from: date)
        }
        return nil
    }
    
    init(task: TaskEntity) {
        self.task = task
    }
}
