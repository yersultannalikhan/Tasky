//
//  CellViewModelType.swift
//  Tasky
//
//  Created by Yersultan Nalikhan on 21.08.2022.
//

import Foundation

protocol CellViewModelType {
    var title: String { get }
    var status: Bool { get }
    var dateString: String? { get }
}
