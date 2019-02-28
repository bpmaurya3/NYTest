//
//  ViewModel.swift
//  NYTimes
//
//  Created by Bhuvanendra Pratap Maurya on 2/26/19.
//  Copyright © 2019 Valtech. All rights reserved.
//

import Foundation

typealias ArticleCellConfig = TableCellConfigurator<ArticleTableViewCell, ArticleCellViewModel>

class ViewModel {
   
    private let netwotkManager: NetworkManager!
  
    private var articles = [CellConfigurator]()

    init(networkManager: NetworkManager) {
        self.netwotkManager = networkManager
    }
    
    func fetchArticle(complition: @escaping (() -> Void)) {
        netwotkManager.fetchMostPopularArticles(sectionNo: "30") { [weak self] (articles, error) in
            if error != nil {
                return
            }
            if let viewModels = articles?.map({ (result) -> ArticleCellConfig in
                return ArticleCellConfig(item: ArticleCellViewModel(with: result))
            }) {
                self?.articles = viewModels
            }
            complition()
        }
    }
    
    func mock(complition: (([ArticleCellViewModel]) -> Void)){
        let viewModels = (0..<10).map {_ in
            return ArticleCellViewModel(title: "Intimidation, Pressure and Humiliation: Inside Trump’s Two-Year War on the Investigations Encircling Him", description: "By MARK MAZZETTI, MAGGIE HABERMAN, NICHOLAS FANDOS and MICHAEL S. SCHMIDT", articleType: "Article", date: "2019-02-19")
        }
        
        complition(viewModels)
    }
    
}

extension ViewModel {
    func numberOfItems() -> Int {
        return articles.count
    }
    
    func item(at index: Int) -> CellConfigurator {
        return articles[index]
    }
}
