//
//  DetailsViewController.swift
//  NYTimes
//
//  Created by Bhuvanendra Pratap Maurya on 2/26/19.
//  Copyright © 2019 Valtech. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var articleImageView: UIImageView!
    
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var byLabel: UILabel!
    @IBOutlet weak var publishDateLabel: UILabel!
    
    var data: ArticleCellViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let data = data else {
            return
        }
        updateUI(data: data)
    }
    
    func updateUI(data: ArticleCellViewModel) {
        titleLabel.text = data.title ?? ""
        captionLabel.text = data.caption ?? ""
        byLabel.text = data.description ?? ""
        if let date = data.date {
            publishDateLabel.text = Utility.getDateString(dateString: date)
        }
    
        if let imageUrl = data.imageUrl {
            articleImageView.downloadImage(imageUrl)
        }
    }

}
