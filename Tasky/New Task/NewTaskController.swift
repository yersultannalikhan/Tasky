//
//  NewTaskController.swift
//  Tasky
//
//  Created by Yersultan Nalikhan on 16.08.2022.
//

import UIKit

class NewTaskController: UIViewController {
    //MARK: - Properties
    private var mainView: NewTaskView!
    var delegate: NewTaskDelegate?
    var viewModel: NewTaskViewModelType?
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.title = "New Task"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelBarBtnTapped(_ :)))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveBarBtnTapped(_:)))
        
        setupViews()
        setupConstraints()
        
        if viewModel != nil {
            mainView.viewModel = viewModel
        } else {
            viewModel = NewTaskViewModel()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    //MARK: - Methods
    func setupViews() {
        mainView = NewTaskView(frame: view.frame)
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
            self.mainView.titleTextField.layer.borderColor = UIColor.red.cgColor
        } else {
            let selectedDate = self.mainView.dateSwitch.isOn ? self.mainView.selectedDate : nil
            if self.viewModel?.newTaskCreationType == .create {
                self.viewModel?.createTask(title: titleText, date: selectedDate, completionHandler: {
                    self.delegate?.addTask()
                    self.dismiss(animated: true)
                })
            } else {
                self.viewModel?.insertTask(title: titleText, date: selectedDate, completionHandler: {
                    self.delegate?.insertTask()
                    self.dismiss(animated: true)
                })
            }
        }
        
    }
}
