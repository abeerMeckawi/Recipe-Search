//
//  ValidationSearchBarExtension.swift
//  IOS Task-Softxpert
//
//  Created by Abeer Meckawi on 01/08/2021.
//

import Foundation


extension SearchViewController{
    
    func validation(input:String)  {
        do {
            let regex = try NSRegularExpression(pattern: ".*[^A-Za-z ].*", options: [])
            if regex.firstMatch(in: input, options: [], range: NSMakeRange(0, searchBar.text!.count)) == nil{
                if !input.isEmpty {
                    presenter.query = input.components(separatedBy: " ")
                }else{
                    createAlert(message: "Enter Your Recipe For Search")
                }
                presenter.viewDidLoad()
            }else {
                createAlert(message: "Only English Letter and Space are Allowed")
            }
        }
        catch {
            print("error")
        }
    }
}
