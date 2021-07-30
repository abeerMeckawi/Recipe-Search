//
//  SearchNetwork.swift
//  IOS Task-Softxpert
//
//  Created by Abeer Meckawi on 30/07/2021.
//

import Foundation

class SearchNetwork {
    
    private let networkLayer = NetworkLayer()
    
    func getRecipes(completion: @escaping (Result<[Recipe]>) -> ()) {
        networkLayer.request(SearchRouterNetwork.getRecipe, decodeToType: [Recipe].self, completion: completion)
    }
}
