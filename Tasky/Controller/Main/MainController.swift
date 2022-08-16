//
//  ViewController.swift
//  Tasky
//
//  Created by Yersultan Nalikhan on 16.08.2022.
//

import UIKit

class MainController: UIViewController {
    // MARK: - Properties
    var mainView: MainView!
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Tasky"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        setupViews()
        setupConstraints()
    }
    // MARK: - Methods
    func setupViews() {
        mainView = MainView(frame: view.frame)
        mainView.tableView.dataSource = self
        mainView.addAction = addTaskBtnTapped
        [mainView].forEach {
            self.view.addSubview($0)
        }
    }
    
    func setupConstraints() {
        mainView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
    }
    
    func addTaskBtnTapped() {
        self.present(UINavigationController(rootViewController: NewTaskController()), animated: true)
    }
}

