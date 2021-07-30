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
    
    func getRecipes() {
        searchNetwork.getRecipes { [weak self] result in
               guard let self = self else { return }
               switch result {
               case .success(let recipes):
                   self.presenter?.searchFetchedSuccessfully(recipes: recipes)
               case .failure(let error):
                   self.presenter?.searchFetchingFailed(withError: error)
               }
           }
    }
    
    
}
