//
//  ViewModelType.swift
//  Tasky
//
//  Created by Yersultan Nalikhan on 21.08.2022.
//

import Foundation
import UIKit

protocol MainViewModelType {
    
    var array: [TaskEntity] { get }
    var selectedIndexPath: IndexPath? { get }
    
    func numberOfRows() -> Int
    func viewModelForCellForRowAt(indexPath: IndexPath) -> CellViewModelType?
    func didSelectRowAt(indexPath: IndexPath)
    func viewModelForSelectedRow() -> NewTaskViewModelType?
    func removeTask(indexPath: IndexPath, completionHandler: @escaping() -> Void)
    func textForLeadingSwipe(indexPath: IndexPath) -> String
    func textColorForLeadingSwipe(indexPath: IndexPath) -> UIColor
    func indexPathForLeadingSwipe(indexPath: IndexPath) -> IndexPath
    func statusChangedViewModelForCellForRowAt(indexPath: IndexPath) -> CellViewModelType?
    func changeStatusOfTask(from: IndexPath)
}
