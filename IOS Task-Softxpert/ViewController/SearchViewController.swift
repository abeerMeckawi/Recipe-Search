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
        self.hideKeyboardWhenTappedAround()
        // presenter.viewDidLoad()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        
        
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        do {
            let input = searchBar.text!
            let regex = try NSRegularExpression(pattern: ".*[^A-Za-z ].*", options: [])
            if regex.firstMatch(in: input, options: [], range: NSMakeRange(0, searchBar.text!.count)) == nil {
                presenter.query = input.components(separatedBy: " ")
                presenter.viewDidLoad()
                searchTableView.reloadData()
            } else {
                print("Only English Letter and Space are Allowed")
            }
        }
        catch {
            print("")
        }
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

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
