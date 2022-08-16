//
//  NewTaskView.swift
//  Tasky
//
//  Created by Yersultan Nalikhan on 16.08.2022.
//

import UIKit

class NewTaskView: UIView {

    // MARK: - Properties
    var dateSwitchAction: ((_ sender: UISwitch) -> ())?
    
    let titleTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Title of new task"
        tf.keyboardType = .default
        tf.autocapitalizationType = .sentences
        tf.borderStyle = .roundedRect
        return tf
    }()
    
    let dateView: UIView = {
        let v = UIView()
        v.backgroundColor = .clear
        return v
    }()
    
    let dateStaticLabel: UILabel = {
        let l = UILabel()
        l.text = "Date"
        l.textColor = .black
        return l
    }()
    
    let dateSwitch: UISwitch = {
        let sw = UISwitch()
        sw.isOn = false
        return sw
    }()
    
    // MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    func setupViews() {
        [titleTextField, dateView].forEach {
            self.addSubview($0)
        }
        dateSwitch.addTarget(self, action: #selector(dateSwitchTapped(_:)), for: .touchUpInside)
        [dateStaticLabel, dateSwitch].forEach {
            dateView.addSubview($0)
        }
    }
    
    func setupConstraints() {
        titleTextField.anchor(top: self.safeAreaLayoutGuide.topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: UIEdgeInsets(top: 12, left: 16, bottom: 0, right: 16), size: CGSize(width: 0, height: 40))
        
        dateView.anchor(top: titleTextField.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: UIEdgeInsets(top: 12, left: 16, bottom: 0, right: 16), size: CGSize(width: 0, height: 40))
        
        dateStaticLabel.anchor(top: nil, leading: dateView.leadingAnchor, bottom: nil, trailing: nil)
        dateStaticLabel.anchorCenterY(centerY: dateView.centerYAnchor)
        
        dateSwitch.anchor(top: nil, leading: nil, bottom: nil, trailing: dateView.trailingAnchor)
        dateSwitch.anchorCenterY(centerY: self.dateView.centerYAnchor)
    }
    // MARK: - Actions
    @objc func dateSwitchTapped(_ sender: UISwitch) {
        dateSwitchAction?(_ : sender)
    }
}
