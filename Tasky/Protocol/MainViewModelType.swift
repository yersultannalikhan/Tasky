//
//  ViewModelType.swift
//  Tasky
//
//  Created by Yersultan Nalikhan on 21.08.2022.
//

import Foundation

protocol MainViewModelType {
    
    var array: [TaskEntity] { get }
    
    func numberOfRows() -> Int
    func viewModelForCellForRowAt(indexPath: IndexPath) -> CellViewModelType?
    func didSelectRowAt(indexPath: IndexPath)
    func viewModelForSelectedRow() -> NewTaskViewModelType?
}
