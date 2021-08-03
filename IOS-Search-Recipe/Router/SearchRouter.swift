//
//  SearchRouter.swift
//  IOS Task-Softxpert
//
//  Created by Abeer Meckawi on 29/07/2021.
//

import UIKit

class SearchRouter: SearchRecipeRouterProtocol {
    
    weak var viewController: UIViewController?
     
     static func createModule() -> UIViewController {
         let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "\(SearchViewController.self)") as! SearchViewController
         let interactor = SearchInteractor()
         let router = SearchRouter()
         let presenter = SearchPresenter(view: view, interactor: interactor, router: router)
         view.presenter = presenter
         interactor.presenter = presenter
         router.viewController = view
         return view
     }
    
    func presentRecipeDetail(from view: SearchRecipeViewProtocol, for hit: Hits) {
         
         let view = RecipeDetailRouter.createModule(hit: hit)

        viewController?.navigationController?.pushViewController(view, animated: true)
     }
    
    
}
