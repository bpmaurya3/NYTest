//
//  NetworkManager.swift
//  NYTimes
//
//  Created by Bhuvanendra Pratap Maurya on 2/27/19.
//  Copyright © 2019 Valtech. All rights reserved.
//

import Foundation

enum NetworkResponse:String {
    case success
    case authenticationError = "You need to be authenticated first."
    case badRequest = "Bad request"
    case outdated = "The url you requested is outdated."
    case failed = "Network request failed."
    case noData = "Response returned with no data to decode."
    case unableToDecode = "We could not decode the response."
}

enum Result<String>{
    case success
    case failure(String)
}

struct NetworkManager {
    static var environment : NetworkEnvironment = .qa
    let router = Router<API>()
    
    func fetchMostPopularArticles(sectionNo: String, completion: @escaping (_ articles: [Results]?, _ error: String?) -> Void) {
        router.request(.article(sectionNo)) { (data, response, error) in
            if error != nil {
                completion(nil, error)
            }
            
            guard let responseData = data else {
                completion(nil, NetworkResponse.noData.rawValue)
                return
            }
            do {
                let apiResponse = try JSONDecoder().decode(Article.self, from: responseData)
                completion(apiResponse.results,nil)
            }catch {
                print(error)
                completion(nil, NetworkResponse.unableToDecode.rawValue)
            }
        }
    }
}
