//
//  SearchPresenter.swift
//  IOS Task-Softxpert
//
//  Created by Abeer Meckawi on 29/07/2021.
//

import Foundation

class SearchPresenter: SearchRecipePresenterProtocol, SearchRecipeInteractorOutputProtocol{
    
    weak var view: SearchRecipeViewProtocol?
    private let interactor : SearchRecipeInteractorInputProtocol
    private let router: SearchRecipeRouterProtocol
    private var recipes = [Recipe]()
    
    var numberOfRows: Int {
        return recipes.count
    }
    
    // retuen recipes.count
    
    init(view: SearchRecipeViewProtocol, interactor: SearchRecipeInteractorInputProtocol, router: SearchRecipeRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        view?.showLoadingIndicator()
        interactor.getRecipes()
    }
    
    func searchFetchedSuccessfully(recipes: [Recipe]) {
        view?.hideLoadingIndicator()
        self.recipes.append(contentsOf: recipes)
        view?.reloadData()
    }
    
    func searchFetchingFailed(withError error: Error) {
        view?.hideLoadingIndicator()
        //faliure show alert
    }
    
    func configure(cell: SearchRecipeCellView, indexPath: IndexPath) {
        let recipe = recipes[indexPath.row]
        let viewModel = SearchViewModel(recipe: recipe)
        cell.configure(viewModel: viewModel)
        
    }
    
    
}
