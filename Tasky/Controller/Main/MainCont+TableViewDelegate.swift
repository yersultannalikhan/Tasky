//
//  MainCont+TableViewDelegate.swift
//  Tasky
//
//  Created by Yersultan Nalikhan on 17.08.2022.
//

import UIKit

extension MainController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.didSelectRowAt(indexPath: indexPath)
        let controller = NewTaskController()
        controller.delegate = self
        controller.viewModel = viewModel?.viewModelForSelectedRow()
        self.present(UINavigationController(rootViewController: controller), animated: true)
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        guard let viewModel = viewModel else { return nil }
        let actionText = viewModel.textForLeadingSwipe(indexPath: indexPath)
        
        let action = UIContextualAction(style: .normal, title: actionText) { [weak self] (action, view, completionHandler) in
            guard let cell = tableView.cellForRow(at: indexPath) as? CellView else { return }
            cell.viewModel = viewModel.statusChangedViewModelForCellForRowAt(indexPath: indexPath)
            let fromIndexPath = IndexPath(row: indexPath.row, section: 0)
            let toIndexPath = viewModel.indexPathForLeadingSwipe(indexPath: indexPath)
            self?.move(from: fromIndexPath, to: toIndexPath)
            completionHandler(true)
        }
        action.backgroundColor = viewModel.textColorForLeadingSwipe(indexPath: indexPath)
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Delete") { [weak self] (action, view, completionHandler) in
            self?.viewModel?.removeTask(indexPath: indexPath, completionHandler: {
                UIView.animate(withDuration: 0.5, animations: {
                    self?.mainView.tableView.deleteRows(at: [indexPath], with: .right)
                })
                completionHandler(true)
            })
        }
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func move(from: IndexPath, to: IndexPath) {
        UIView.animate(withDuration: 0.5, animations: {
            self.mainView.tableView.moveRow(at: from, to: to)}) { (true) in
                self.viewModel?.changeStatusOfTask(from: from)
            }
    }
}
