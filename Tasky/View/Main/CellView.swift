//
//  CellView.swift
//  Tasky
//
//  Created by Yersultan Nalikhan on 21.08.2022.
//

import UIKit

class CellView: UITableViewCell {
    var viewModel: CellViewModelType? {
        didSet {
            guard let viewModel = viewModel else { return }
            textLabel?.text = viewModel.title
            detailTextLabel?.text = viewModel.dateString
        }
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
