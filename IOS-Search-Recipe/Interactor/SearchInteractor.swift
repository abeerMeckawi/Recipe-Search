//
//  SearchInteractor.swift
//  IOS Task-Softxpert
//
//  Created by Abeer Meckawi on 29/07/2021.
//

import Foundation

class SearchInteractor: SearchRecipeInteractorInputProtocol{
    
    weak var presenter:SearchRecipeInteractorOutputProtocol?
    private let searchNetwork = SearchNetwork()
    
    func getRecipes(query:[String],health:String) {
        searchNetwork.getRecipes(query: query,health: health) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let food):
                if let hits = food.hits{
                    self.presenter?.searchFetchedSuccessfully(hits:hits)
                }
            case .failure(let error):
                self.presenter?.searchFetchingFailed(withError: error)
            }
        }
    }
    
    
}
