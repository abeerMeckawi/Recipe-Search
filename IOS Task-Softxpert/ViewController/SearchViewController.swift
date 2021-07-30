//
//  SearchViewController.swift
//  IOS Task-Softxpert
//
//  Created by Abeer Meckawi on 29/07/2021.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    var presenter: SearchRecipePresenterProtocol!
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTableView.dataSource = self
        searchTableView.delegate = self
        searchBar.delegate = self
        presenter.viewDidLoad()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
    
    @IBAction func didChangeFilterSegment(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: break
        case 2: break
        case 3: break
        case 4: break
        default:
            break
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath) as! SearchTableViewCell
        presenter.configure(cell: cell, indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 138
    }
}

extension SearchViewController: SearchRecipeViewProtocol{

        
    func showLoadingIndicator() {
        print("Should Show User indecator")
        //Implement any loading indecator
    }
    
    func hideLoadingIndicator() {
        print("Should Hide  Loading indecator")
    }
    
    func reloadData() {
        searchTableView.reloadData()
    }
    
}
