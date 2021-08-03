//
//  SearchViewController.swift
//  IOS Task-Softxpert
//
//  Created by Abeer Meckawi on 29/07/2021.
//

import UIKit
import DropDown

class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
  
    var presenter: SearchRecipePresenterProtocol!
    let activityIndicator = UIActivityIndicatorView(style: .gray)
    var dropdown = DropDown()
    var lblTextInfo : UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchTableView: UITableView!
    @IBOutlet weak var segmentControlFilter: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTableView.dataSource = self
        searchTableView.delegate = self
        searchBar.delegate = self
        dropdownCoordinate()
        segmentControlFilter.isEnabled = false
        segmentControlFilter.isHidden = true
        searchTableView.isHidden = true
        addLabel()
        self.hideKeyboardWhenTappedAround()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        showSearchHistory()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        segmentControlFilter.isEnabled = true
        segmentControlFilter.isHidden = false
        lblTextInfo.isHidden = true
        searchTableView.isHidden = false
        let input = searchBar.text!
        validation(input: input)
        dropdown.hide()
        presenter.addSearchHistory(input: input)
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
        return 155
    }
    
    func addLabel(){
        lblTextInfo = UILabel(frame: CGRect(x: 0, y: 0, width: 290, height: 36))
        lblTextInfo .center = CGPoint(x: 210, y: 460)
        lblTextInfo .textAlignment = .center
        lblTextInfo .lineBreakMode = .byWordWrapping
        lblTextInfo .font = lblTextInfo .font.withSize(30)
        lblTextInfo .text = "Search For Any Recipe"
        self.view.addSubview(lblTextInfo )
        
    }
    
}
