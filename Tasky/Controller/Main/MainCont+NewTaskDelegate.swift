//
//  MainCont+NewTaskDelegate.swift
//  Tasky
//
//  Created by Yersultan Nalikhan on 23.08.2022.
//

import UIKit

protocol NewTaskDelegate {
    func addTask()
    func insertTask()
}

extension MainController: NewTaskDelegate {
    func addTask() {
        DispatchQueue.main.async {
            self.viewModel = MainViewModel()
            self.mainView.tableView.reloadData()
        }
    }
    
    func insertTask() {
        guard let viewModel = viewModel, let selectedIndexPath = viewModel.selectedIndexPath else { return }
        DispatchQueue.main.async {
            self.mainView.tableView.beginUpdates()
            self.mainView.tableView.reloadRows(at: [selectedIndexPath], with: .fade)
            self.mainView.tableView.endUpdates()
        }
    }
}
