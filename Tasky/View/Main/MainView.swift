//
//  MainView.swift
//  Tasky
//
//  Created by Yersultan Nalikhan on 16.08.2022.
//

import UIKit

class MainView: UIView {
    // MARK: - Properties
    var addAction: (() -> ())?
    var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    var bottomView: UIView = {
        let v = UIView()
        v.backgroundColor = .systemGray5
        return v
    }()
    
    var addButton: UIButton = {
        let b = UIButton(type: .system)
        b.setTitle("+ Add new task", for: .normal)
        b.setTitleColor(UIColor.systemBlue, for: .normal)
        return b
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
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

        bottomView.addSubview(addButton)
        
        addButton.addTarget(self, action: #selector(addBtnTapped(_:)), for: .touchUpInside)
        
        
        [tableView, bottomView].forEach {
            self.addSubview($0)
        }
    }
    func setupConstraints() {
        tableView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomView.topAnchor, trailing: trailingAnchor)
        bottomView.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, size: CGSize(width: 0, height: safeAreaBottom + 40))
        
        addButton.anchor(top: bottomView.topAnchor, leading: bottomView.leadingAnchor, bottom: nil, trailing: bottomView.trailingAnchor, size: CGSize(width: 0, height: 40))
    }
    
    // MARK: - Actions
    @objc func addBtnTapped(_ sender: UIButton) {
        addAction?()
    }
}
