//
//  RecipesDetailsViewController.swift
//  IOS Task-Softxpert
//
//  Created by Abeer Meckawi on 31/07/2021.
//

import UIKit
import SafariServices

class RecipesDetailsViewController: UIViewController{
    
    var presenter: RecipeDetailPresenterProtocol?
    
    @IBOutlet weak var imgRecipeDetails: UIImageView!
    @IBOutlet weak var lblRecipeDetailsTitle: UILabel!
    @IBOutlet weak var lblRecipeIngredient: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    @IBAction func shareRecipe(_ sender: Any) {
        shareUrl()
    }
    
    @IBAction func goToWebsite(_ sender: Any) {
       openSafari()
    }
}

extension RecipesDetailsViewController: RecipeDetailViewProtocol{
    
    func showRecipeDetails(recipe: SearchViewModel) {
        imgRecipeDetails.sd_setImage(with:recipe.image, placeholderImage: UIImage(named: "placeholder.png"))
        lblRecipeDetailsTitle.text = recipe.label
        lblRecipeIngredient.text = recipe.ingredientLines?.joined(separator: "\n")
    }
    
    func openSafari() {
        if let url = URL(string: presenter!.urlStr) {
            let config = SFSafariViewController.Configuration()
            config.entersReaderIfAvailable = true
            let safariVC = SFSafariViewController(url: url, configuration: config)
            present(safariVC, animated: true)
        }
    }
    
    func shareUrl() {
        if let shareUrl :URL = URL(string: presenter!.urlStr){
        let activityViewController = UIActivityViewController(activityItems : [shareUrl], applicationActivities: nil)
        
        activityViewController.popoverPresentationController?.sourceView = self.view
        
        activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook,
            UIActivity.ActivityType.postToTwitter,
            UIActivity.ActivityType.mail]

        self.present(activityViewController, animated: true, completion: nil)
        }
    }  
}
