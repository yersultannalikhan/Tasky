//
//  ViewModel.swift
//  Tasky
//
//  Created by Yersultan Nalikhan on 18.08.2022.
//

import Foundation

class MainViewModel: MainViewModelType {
    var array: [TaskEntity]
    private var selectedRow: Int? = nil
    
    init() {
        array = TaskData.getTasks()
    }
    
    func numberOfRows() -> Int {
        return array.count
    }
    
    func viewModelForCellForRowAt(indexPath: IndexPath) -> CellViewModelType? {
        return CellViewModel(task: array[indexPath.row])
    }
    
    func didSelectRowAt(indexPath: IndexPath) {
        selectedRow = indexPath.row
    }
    
    func viewModelForSelectedRow() -> NewTaskViewModelType? {
        guard let selectedRow = selectedRow else { return nil }
        return NewTaskViewModel(task: array[selectedRow])
    }
    
    
}
