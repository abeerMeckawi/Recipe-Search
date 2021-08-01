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
    
    @IBAction func didChangeFilterSegment(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            presenter.health = "all"
            presenter.viewDidLoad()
            break
        case 1:
            presenter.health = "low-sugar"
            presenter.viewDidLoad()
            break
        case 2:
            presenter.health = "keto-friendly"
            presenter.viewDidLoad()
            break
        case 3:
            presenter.health = "vegan"
            presenter.viewDidLoad()
            break
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.showRecipeDetails(indexPath: indexPath)
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
    
    func createAlert(message : String) {
        let alertController = UIAlertController(title: "Alert", message:message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK",style: .default))
        self.present(alertController, animated: true, completion: nil)
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
