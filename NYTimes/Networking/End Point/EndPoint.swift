//
//  EndPoint.swift
//  NYTimes
//
//  Created by Bhuvanendra Pratap Maurya on 2/27/19.
//  Copyright © 2019 Valtech. All rights reserved.
//

import Foundation

enum NetworkEnvironment {
    case qa
    case production
    case staging
}

public enum API {
    case article(String)
    case none
}

extension API: EndPointType {
    var httpMethod: HTTPMethod {
        switch self {
        case .article:
            return .get
        case .none:
            return .post
        }
    }
    
    var environmentBaseURL : String {
        switch NetworkManager.environment {
        case .production: return "https://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/"
        case .qa: return "https://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/"
        case .staging: return "https://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/"
        }
    }
    
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        switch self {
        case .article(let sectionNo):
            return "\(sectionNo).json"
        default:
           return ""
        }
    }

    
    var task: HTTPTask {
        switch self {
        case .article:
            return .requestParameters(bodyParameters: nil,
                                      bodyEncoding: .urlEncoding,
                                      urlParameters: ["api-key": Configuration.API_KEY])
        case .none:
            return .request
        
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}
