//
//  NewViewModelType.swift
//  Tasky
//
//  Created by Yersultan Nalikhan on 21.08.2022.
//

import Foundation

protocol NewTaskViewModelType {
    var indexOfTask: Int? { get }
    var title: String  { get }
    var date: Date? { get }
    var dateString: String? { get }
}
