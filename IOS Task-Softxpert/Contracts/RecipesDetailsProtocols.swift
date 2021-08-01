//
//  RecipesDetailsProtocols.swift
//  IOS Task-Softxpert
//
//  Created by Abeer Meckawi on 31/07/2021.
//

import Foundation

protocol RecipeDetailViewProtocol: AnyObject {
    
    var presenter: RecipeDetailPresenterProtocol? { get set }
    func showRecipeDetails(recipe: SearchViewModel)
}

protocol RecipeDetailPresenterProtocol: AnyObject {
    
    var view: RecipeDetailViewProtocol? { get set }
    var interactor: RecipeDetailInteractorInputProtocol? { get set}
    var router: RecipeDetailRouterProtocol? { get set }
    func viewDidLoad()
}

protocol RecipeDetailInteractorInputProtocol: AnyObject {
    
    var presenter: RecipeDetailInteractorOutputProtocol? { get set }
    var hit: Hits? { get set }
}

protocol RecipeDetailInteractorOutputProtocol: AnyObject {

}

protocol RecipeDetailRouterProtocol: AnyObject {
   
}
