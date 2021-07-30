//
//  SearchRecipeInteractorInputProtocol.swift
//  IOS Task-Softxpert
//
//  Created by Abeer Meckawi on 29/07/2021.
//

import Foundation

protocol SearchRecipeInteractorInputProtocol{
    
    var presenter: SearchRecipeInteractorOutputProtocol? { get set }
    func getRecipes()
}


