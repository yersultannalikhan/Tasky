//
//  CellViewModel.swift
//  Tasky
//
//  Created by Yersultan Nalikhan on 21.08.2022.
//

import Foundation

class CellViewModel: CellViewModelType {
    // MARK: - Properties
    private var task: TaskEntity
    
    var titleAttributedText: NSMutableAttributedString {
        let attributedString = NSMutableAttributedString.init(string: task.title)
        attributedString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSRange.init(location: 0, length: attributedString.length))
        if task.status == false {
            attributedString.setAttributes([:], range: NSRange(0..<task.title.count))
        }
        return attributedString
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
    // MARK: - LifeCycle
    init(task: TaskEntity) {
        self.task = task
    }
}
