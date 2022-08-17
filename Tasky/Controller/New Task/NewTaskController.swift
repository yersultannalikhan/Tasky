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
    var delegate: NewTaskDelegate?
    var task: TaskEntity?
    var taskIndex: Int? = nil
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.title = "New Task"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelBarBtnTapped(_ :)))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveBarBtnTapped(_:)))
        
        setupViews()
        setupConstraints()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
        guard let titleText = mainView.titleTextField.text else { return }
        if titleText.isEmpty {
            mainView.titleTextField.layer.borderColor = UIColor.red.cgColor
        } else {
            let task = TaskData(title: titleText, date: nil, status: false)
            if mainView.dateSwitch.isOn {
                task.date = mainView.selectedDate
            }
            delegate?.addTask(task: task, index: taskIndex)
            self.dismiss(animated: true)
        }
        
    }
    
    @objc func dateSwitchTapped(_ sender: UISwitch) {
        mainView.isDateTextFieldHidden(!sender.isOn)
    }
}
