//
//  SearchHistoryExtention.swift
//  IOS Task-Softxpert
//
//  Created by Abeer Meckawi on 01/08/2021.
//

import UIKit

extension SearchViewController{
    
    func dropdownCoordinate(){
        dropdown.anchorView = searchBar
        dropdown.bottomOffset = CGPoint(x: 0, y:(dropdown.anchorView?.plainView.bounds.height)!)
        dropdown.backgroundColor = .white
        dropdown.direction = .bottom
        dropdown.selectionAction = {(index: Int, item: String) in
            self.searchBar.text = item
        }
    }
    
    func showSearchHistory(){
        dropdown.dataSource = presenter.getSearchHistory().reversed()
        dropdown.cellNib = UINib(nibName: "SearchDropDownCell", bundle: nil)
        dropdown.customCellConfiguration = {index, title, cell in
            guard let cell = cell as? SearchDropDownCell else{return}
            cell.imgSearchHistory.image = UIImage(named: "history")
        }
        if presenter.recentHistory.count != 0 {
            dropdown.show()
        }
    }
}
