//
//  SearchRecipeRouterProtocol.swift
//  IOS Task-Softxpert
//
//  Created by Abeer Meckawi on 29/07/2021.
//

import Foundation

protocol SearchRecipeRouterProtocol{
    
    func presentRecipeDetail(from view: SearchRecipeViewProtocol, for hit: Hits)

}
