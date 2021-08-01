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
    var query :[String]{get set}
    var health:String{get set}
    func viewDidLoad()
    func configure(cell: SearchRecipeCellView, indexPath: IndexPath)
    func showRecipeDetails(indexPath :IndexPath)
    
}
