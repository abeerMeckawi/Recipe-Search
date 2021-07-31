//
//  searchRouter.swift
//  IOS Task-Softxpert
//
//  Created by Abeer Meckawi on 29/07/2021.
//

import Foundation
import Alamofire

enum SearchRouterNetwork{
    
    case getRecipe(query:[String],health:String)
    
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
    
    var url :URL{
        
        let urlComponents = NSURLComponents(string: Constant.baseURL)!
        switch self{
        case .getRecipe(let query,let health):
            
            urlComponents.queryItems = [
                URLQueryItem(name: "type", value: "public"),
                URLQueryItem(name: "q", value: query.joined(separator: " ")),
                URLQueryItem(name: "app_id", value: Constant.appId),
                URLQueryItem(name: "app_key", value: Constant.app_key),
                URLQueryItem(name: "health", value: health)
            ]
            if health == "all" || health == ""{
                urlComponents.queryItems?.removeLast()
            }
        }
        return urlComponents.url!
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
