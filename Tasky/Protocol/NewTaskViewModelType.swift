//
//  NewViewModelType.swift
//  Tasky
//
//  Created by Yersultan Nalikhan on 21.08.2022.
//

import Foundation

protocol NewTaskViewModelType {
    var title: String  { get }
    var newTaskCreationType: NewTaskCreationType { get }
    var date: Date? { get }
    var dateString: String? { get }
    func createTask(title: String, date: Date?, completionHandler: @escaping () -> Void)
    func insertTask(title: String, date: Date?, completionHandler: @escaping () -> Void)
}
