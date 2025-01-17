//
//  ArticlesListViewModel.swift
//  NewsApi
//
//  Created by Azamat Kenjebayev on 5/13/24.
//

import Foundation

class ArticlesListViewModel {
    
    private let networkManager = NetworkManager()
    private(set) var articles: [ArticleListModel] = []
    var reloadTableViewClosure: (() -> Void)?
    var showErrorClosure: ((Error) -> Void)?
    
    func fetchArticles() {
        
        networkManager.fetchData { [weak self] (articles, error) in
            guard let self = self else { return }
            if let error = error {
                self.showErrorClosure?(error)
            }
            
            if let articles = articles {
                self.articles = articles
                self.reloadTableViewClosure?()
            }
        }
    }
}
