//
//  RecipeDetailsRouter.swift
//  IOS Task-Softxpert
//
//  Created by Abeer Meckawi on 31/07/2021.
//

import UIKit

class RecipeDetailRouter: RecipeDetailRouterProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule(hit:Hits) -> UIViewController {
        let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "\(RecipesDetailsViewController.self)") as! RecipesDetailsViewController
        let interactor = RecipeDetailInteractor()
        let router = RecipeDetailRouter()
        let presenter = RecipeDetailPresenter(view: view, interactor: interactor, router: router)
        interactor.hit = hit
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }
    
}
