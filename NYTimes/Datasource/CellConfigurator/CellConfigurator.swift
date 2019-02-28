//
//  CellConfigurator.swift
//  NYTimes
//
//  Created by Bhuvanendra Pratap Maurya on 2/27/19.
//  Copyright © 2019 Valtech. All rights reserved.
//

import UIKit

protocol ConfigurableCell {
    static var reuseIdentifier: String { get }
    associatedtype DataType
    func configure(data: DataType, actionProxy: CellActionProxy?)
}

extension ConfigurableCell {
    static var reuseIdentifier: String { return String(describing: Self.self) }
}

protocol CellConfigurator {
    static var reuseId: String { get }
    func configure(cell: UIView, actionProxy: CellActionProxy?)
}

class TableCellConfigurator<CellType: ConfigurableCell, DataType>: CellConfigurator where CellType.DataType == DataType, CellType: UITableViewCell {
    
    static var reuseId: String { return CellType.reuseIdentifier }
    
    let item: DataType
    
    init(item: DataType) {
        self.item = item
    }
    
    func configure(cell: UIView, actionProxy: CellActionProxy?) {
        (cell as! CellType).configure(data: item, actionProxy: actionProxy)
    }
}
