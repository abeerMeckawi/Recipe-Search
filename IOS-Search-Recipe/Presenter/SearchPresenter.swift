//
//  SearchPresenter.swift
//  IOS Task-Softxpert
//
//  Created by Abeer Meckawi on 29/07/2021.
//

import Foundation

class SearchPresenter: SearchRecipePresenterProtocol{
    
    weak var view: SearchRecipeViewProtocol?
    private let interactor : SearchRecipeInteractorInputProtocol
    private let router: SearchRecipeRouterProtocol
    private let searchHisroryDef = UserDefaults.standard
    private var hits = [Hits]()
    var recentHistory = [String]()
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
    
    func configure(cell: SearchRecipeCellView, indexPath: IndexPath) {
        let hit = hits[indexPath.row]
        let viewModel = SearchViewModel(hit: hit)
        cell.configure(viewModel: viewModel)
    }
    
    func addSearchHistory(input: String) {
        if recentHistory.count < 10 {
            recentHistory.append(input)
        }else if recentHistory.contains(input){
            recentHistory = getSearchHistory()
        }else{
            recentHistory.removeFirst()
            recentHistory.insert(input, at: recentHistory.count)
        }
        searchHisroryDef.set(recentHistory, forKey: "SearchHistorry")
    }
    func getSearchHistory() -> [String]{
        
        let savedHistory = searchHisroryDef.object(forKey: "SearchHistorry") as? [String] ?? [String]()
        recentHistory = savedHistory
        return recentHistory
    }
    
    func showRecipeDetails(indexPath :IndexPath) {
        guard let view = view else { return }
        let hit = hits[indexPath.row]
        router.presentRecipeDetail(from: view, for: hit)
    }
}

extension SearchPresenter :SearchRecipeInteractorOutputProtocol{
    
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
    
}
