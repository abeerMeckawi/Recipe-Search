//
//  SearchRecipeInteractorOutputProtocol.swift
//  IOS Task-Softxpert
//
//  Created by Abeer Meckawi on 29/07/2021.
//

import Foundation

protocol SearchRecipeInteractorOutputProtocol : AnyObject{
    
    func searchFetchedSuccessfully(recipes: [Recipe])
    func searchFetchingFailed(withError error: Error)
}
