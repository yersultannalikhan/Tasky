//
//  ViewController.swift
//  Tasky
//
//  Created by Yersultan Nalikhan on 16.08.2022.
//

import UIKit
import CoreData

class MainController: UIViewController {
    // MARK: - Properties
    var mainView: MainView!
    var viewModel: MainViewModelType?
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Tasky"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        setupViews()
        setupConstraints()
        
        viewModel = MainViewModel()
        mainView.tableView.reloadData()
    }
    // MARK: - Methods
    func setupViews() {
        mainView = MainView(frame: view.frame)
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
        mainView.addAction = addTaskBtnTapped
        [mainView].forEach {
            self.view.addSubview($0)
        }
    }
    
    func setupConstraints() {
        mainView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
    }
    
    func addTaskBtnTapped() {
        let controller = NewTaskController()
        controller.delegate = self
        self.present(UINavigationController(rootViewController: controller), animated: true)
    }
}

