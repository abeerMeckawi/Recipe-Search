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
    private var hits = [Hits]()
    var query = [String]()
    var health = ""
    
    var numberOfRows: Int {
        return hits.count
    }
    
    init(view: SearchRecipeViewProtocol, interactor: SearchRecipeInteractorInputProtocol, router: SearchRecipeRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        view?.showLoadingIndicator()
        interactor.getRecipes(query: query,health: health)
    }

    func searchFetchedSuccessfully(hits: [Hits]) {
        if hits.count == 0{
            view?.createAlert(message:"Not Data Avaliable For This Recipe")
        }else{
            view?.hideLoadingIndicator()
            self.hits = hits
            view?.reloadData()
        }
    }
    
    func searchFetchingFailed(withError error: Error) {
        view?.hideLoadingIndicator()
        view?.createAlert(message:"Try Agin Failed to Fetch Data")
    }
    
    func configure(cell: SearchRecipeCellView, indexPath: IndexPath) {
        let hit = hits[indexPath.row]
        let viewModel = SearchViewModel(hit: hit)
        cell.configure(viewModel: viewModel)
        
    }
    
}
