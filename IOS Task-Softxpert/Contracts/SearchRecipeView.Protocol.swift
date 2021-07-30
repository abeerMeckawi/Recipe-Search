//
//  SearchRecipeView.swift
//  IOS Task-Softxpert
//
//  Created by Abeer Meckawi on 29/07/2021.
//

import Foundation

protocol SearchRecipeViewProtocol: AnyObject {
    
    var presenter :SearchRecipePresenterProtocol!{get set}
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func reloadData()
}
