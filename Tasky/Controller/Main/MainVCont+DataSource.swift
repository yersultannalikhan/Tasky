//
//  MainView+DataSource.swift
//  Tasky
//
//  Created by Yersultan Nalikhan on 16.08.2022.
//

import UIKit
import CoreData

protocol NewTaskDelegate {
    func addTask()
}

extension MainController: UITableViewDataSource, NewTaskDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CellView
        let cellViewModel = viewModel?.viewModelForCellForRowAt(indexPath: indexPath)
        guard let cell = cell, let cellViewModel = cellViewModel else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.viewModel = cellViewModel
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRows() ?? 0
    }
    
    func addTask() {
        DispatchQueue.main.async {
            self.viewModel = MainViewModel()
            self.mainView.tableView.reloadData()
        }
    }

}
