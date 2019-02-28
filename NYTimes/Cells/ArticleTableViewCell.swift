//
//  ArticleTableViewCell.swift
//  NYTimes
//
//  Created by Bhuvanendra Pratap Maurya on 2/26/19.
//  Copyright © 2019 Valtech. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell, ConfigurableCell {
    @IBOutlet weak var iconImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var otherLabel: UILabel!
    @IBOutlet weak var dateField: UITextField!
    
    var cellModel: ArticleCellViewModel? {
        didSet {
            guard let cellModel = cellModel else {
                return
            }
            setUIData(cellModel: cellModel)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        setupUI()
    }
    
    func setupUI() {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        let image = UIImage(named: "calendar")
        imageView.image = image
        dateField.leftView = imageView
        dateField.leftViewMode = .always
        
        titleLabel.numberOfLines = 2
        descriptionLabel.numberOfLines = 0
        dateField.isUserInteractionEnabled = false
        selectionStyle = .none
    }
    
    func setUIData(cellModel: ArticleCellViewModel) {
        if let title = cellModel.title {
            titleLabel.text = title
        }
        if let description = cellModel.description {
            descriptionLabel.text = description
        }
        if let type = cellModel.articleType {
            otherLabel.text = type.uppercased()
        }
        if let publishDate = cellModel.date {
            dateField.text = publishDate
        }
    }
    
    func configure(data: ArticleCellViewModel, actionProxy: CellActionProxy?) {
        if let title = data.title {
            titleLabel.text = title
        }
        if let description = data.description {
            descriptionLabel.text = description
        }
        if let type = data.articleType {
            otherLabel.text = type.uppercased()
        }
        if let publishDate = data.date {
            dateField.text = publishDate
        }
        if let imageUrl = data.thumbnailUrl {
            iconImage.downloadImage(imageUrl)
        }
    }
}
