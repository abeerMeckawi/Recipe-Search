//
//  SearchVC+SearchPresenterProtocolExtension.swift
//  IOS Task-Softxpert
//
//  Created by Abeer Meckawi on 01/08/2021.
//

import UIKit
extension SearchViewController: SearchRecipeViewProtocol{
    
    func showLoadingIndicator() {
        view.addSubview(activityIndicator)
        activityIndicator.frame = view.bounds
        activityIndicator.startAnimating()
        if #available(iOS 13.0, *) {
            activityIndicator.style = .large
            activityIndicator.color = .green
        }
    }
    
    func hideLoadingIndicator() {
        activityIndicator.removeFromSuperview()
    }
    
    func reloadData() {
        searchTableView.reloadData()
    }
    
    func createAlert(message : String) {
        let alertController = UIAlertController(title: "Alert", message:message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK",style: .default))
        alertController.view.layoutIfNeeded()
        self.present(alertController, animated: true, completion: nil)
    }
}
