//
//  ViewController.swift
//  NYTimes
//
//  Created by Bhuvanendra Pratap Maurya on 2/26/19.
//  Copyright © 2019 Valtech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak private var tableView: UITableView!
    private var viewModel: ViewModel!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ViewModel(networkManager: NetworkManager())

        setupTableView()
        loadData()
    }
    
    func setupTableView() {
        tableView.register(UINib(nibName: "ArticleTableViewCell", bundle: nil), forCellReuseIdentifier: "ArticleTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 44.0
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView()
    }
    
    func loadData() {
        viewModel.fetchArticle { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = viewModel.item(at: indexPath.row)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: type(of: item).reuseId, for: indexPath)
        item.configure(cell: cell, actionProxy: nil)
        return cell
    }
}
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = storyBoard.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController
        let articleConfig = viewModel.item(at: indexPath.row) as? ArticleCellConfig
        detailVC?.data =  articleConfig?.item
        self.navigationController?.pushViewController(detailVC!, animated: true)
    }
}

