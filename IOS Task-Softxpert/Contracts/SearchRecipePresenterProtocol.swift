//
//  SearchRecipePresenterProtocol.swift
//  IOS Task-Softxpert
//
//  Created by Abeer Meckawi on 29/07/2021.
//

import Foundation

protocol SearchRecipePresenterProtocol: AnyObject {
    
    var view: SearchRecipeViewProtocol?{get set}
    var numberOfRows: Int{get}
    func viewDidLoad()
    func configure(cell: SearchRecipeCellView, indexPath: IndexPath)
    
}