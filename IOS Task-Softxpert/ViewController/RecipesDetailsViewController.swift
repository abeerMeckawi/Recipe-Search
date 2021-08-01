//
//  RecipesDetailsViewController.swift
//  IOS Task-Softxpert
//
//  Created by Abeer Meckawi on 31/07/2021.
//

import UIKit

class RecipesDetailsViewController: UIViewController, RecipeDetailViewProtocol {
     
    var presenter: RecipeDetailPresenterProtocol?

    @IBOutlet weak var imgRecipeDetails: UIImageView!
    @IBOutlet weak var lblRecipeDetailsTitle: UILabel!
    @IBOutlet weak var lblRecipeIngredient: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    @IBAction func shareRecipe(_ sender: Any) {
    }
    
    @IBAction func goToWebsite(_ sender: Any) {
    }
    
    func showRecipeDetails(recipe: SearchViewModel) {
        imgRecipeDetails.sd_setImage(with:recipe.image, placeholderImage: UIImage(named: "placeholder.png"))
        lblRecipeDetailsTitle.text = recipe.label
        lblRecipeIngredient.text = recipe.ingredientLines?.joined(separator: "\n")
        
    }
    
}
