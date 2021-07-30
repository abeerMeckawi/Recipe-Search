//
//  searchRouter.swift
//  IOS Task-Softxpert
//
//  Created by Abeer Meckawi on 29/07/2021.
//

import Foundation
import Alamofire

enum SearchRouterNetwork{
    
    case getRecipe
}
extension SearchRouterNetwork: URLRequestConvertible {

    var method: HTTPMethod {
        switch self {
        case .getRecipe:
            return .get
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .getRecipe:
            return nil
        }
    }
    
    var url: URL {
        let relativePath : String?
        switch self {
        case .getRecipe:
            relativePath = Constant.pathURL
        }
        
        var url = URL(string: Constant.baseURL)!
        if let relativePath = relativePath {
            url = url.appendingPathComponent(relativePath)
        }
        return url
    }
    
    var encoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        return try encoding.encode(urlRequest, with: parameters)
    }
}
