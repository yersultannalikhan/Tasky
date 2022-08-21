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
    
//    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
//        let task = self.taskArray[indexPath.row]
//        let actionText = task.status ? "Undone" : "Done"
//        let taskTitle = task.title ?? "Empty text"
//        let count = self.taskArray.count
//
//        let action = UIContextualAction(style: .normal, title: actionText) { [weak self] (action, view, completionHandler) in
//            let cell = tableView.cellForRow(at: indexPath)
//            let attributedString = NSMutableAttributedString.init(string: taskTitle)
//           attributedString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSRange.init(location: 0, length: attributedString.length))
//
//            var toIndexPath = IndexPath(row: count-1 , section: 0)
//
//            if task.status == true {
//                attributedString.setAttributes([:], range: NSRange(0..<taskTitle.count))
//                cell?.textLabel?.attributedText = attributedString
//                toIndexPath = IndexPath(row: 0 , section: 0)
//            } else {
//                cell?.textLabel?.attributedText = attributedString
//            }
//
//            let fromIndexPath = IndexPath(row: indexPath.row, section: 0)
//            self?.move(from: fromIndexPath, to: toIndexPath)
//            completionHandler(true)
//        }
//        action.backgroundColor = task.status ? UIColor.systemRed : UIColor.systemBlue
//        return UISwipeActionsConfiguration(actions: [action])
//    }
    
//    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        let action = UIContextualAction(style: .destructive, title: "Delete") { [weak self] (action, view, completionHandler) in
//            self?.taskArray.remove(at: indexPath.row)
//            self?.deleteRow(indexPath: indexPath)
//            completionHandler(true)
//        }
//        return UISwipeActionsConfiguration(actions: [action])
//    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func move(from: IndexPath, to: IndexPath) {
//        UIView.animate(withDuration: 0.5, animations: {
//            self.mainView.tableView.moveRow(at: from, to: to)}) { (true) in
//                self.taskArray[from.row].status = !self.taskArray[from.row].status
//                let fromTask = self.taskArray[from.row]
//                let toTask = self.taskArray[to.row]
//                self.taskArray[from.row] = toTask
//                self.taskArray[to.row] = fromTask
//            }
    }
    
    func deleteRow(indexPath: IndexPath) {
//        UIView.animate(withDuration: 0.5, animations: {
//            self.mainView.tableView.deleteRows(at: [indexPath], with: .automatic)
//        })
    }
    
}
