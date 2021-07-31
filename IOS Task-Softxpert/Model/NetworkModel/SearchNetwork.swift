//
//  SearchNetwork.swift
//  IOS Task-Softxpert
//
//  Created by Abeer Meckawi on 30/07/2021.
//

import Foundation

class SearchNetwork {
    
    private let networkLayer = NetworkLayer()
    
    func getRecipes(query:[String],completion: @escaping (Result<Food>) -> ()) {
        networkLayer.request(SearchRouterNetwork.getRecipe(query: query), decodeToType: Food.self, completion: completion)
    }
}
