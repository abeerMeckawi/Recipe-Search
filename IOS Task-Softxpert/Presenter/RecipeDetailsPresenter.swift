//
//  RecipeDetailsPresenter.swift
//  IOS Task-Softxpert
//
//  Created by Abeer Meckawi on 31/07/2021.
//

import Foundation

class RecipeDetailPresenter: RecipeDetailPresenterProtocol,RecipeDetailInteractorOutputProtocol {
    
    weak var view: RecipeDetailViewProtocol?
    var router: RecipeDetailRouterProtocol?
    var interactor: RecipeDetailInteractorInputProtocol?
    
    init(view: RecipeDetailViewProtocol, interactor: RecipeDetailInteractorInputProtocol, router: RecipeDetailRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        if let hit = interactor?.hit {
        let viewModel = SearchViewModel(hit: hit)
        view?.showRecipeDetails(recipe:viewModel)
        }
    }
    
}
