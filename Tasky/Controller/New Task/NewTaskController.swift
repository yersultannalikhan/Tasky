//
//  NewTaskController.swift
//  Tasky
//
//  Created by Yersultan Nalikhan on 16.08.2022.
//

import UIKit

class NewTaskController: UIViewController {

    //MARK: - Properties
    var mainView: NewTaskView!
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.title = "New task info"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelBarBtnTapped(_ :)))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveBarBtnTapped(_:)))
        
        setupViews()
        setupConstraints()
    }
    //MARK: - Methods
    func setupViews() {
        mainView = NewTaskView(frame: view.frame)
        mainView.dateSwitchAction = dateSwitchTapped(_:)
        view.addSubview(mainView)
    }
    
    func setupConstraints() {
        mainView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
    }
    //MARK: - Actions
    @objc func cancelBarBtnTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
    
    @objc func saveBarBtnTapped(_ sender: UIBarButtonItem) {
        print("save")
    }
    
    @objc func dateSwitchTapped(_ sender: UISwitch) {
        print(sender.isOn)
    }
}
