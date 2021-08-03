//
//  SearchTableViewCell.swift
//  IOS Task-Softxpert
//
//  Created by Abeer Meckawi on 29/07/2021.
//

import UIKit
import SDWebImage

class SearchTableViewCell: UITableViewCell,SearchRecipeCellView {
  
    @IBOutlet weak var imgRecipe: UIImageView!
    
    @IBOutlet weak var lblRecipeTitle: UILabel!
    
    @IBOutlet weak var lblRecipeSource: UILabel!
    
    @IBOutlet weak var lblRecipeHeaalth: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        lblRecipeTitle.sizeToFit()
    }
    
    func configure(viewModel: SearchViewModel) {
       
        imgRecipe.sd_setImage(with:viewModel.image, placeholderImage: UIImage(named: "placeholder.png"))
        lblRecipeTitle.text = viewModel.label
        lblRecipeSource.text = viewModel.source
        lblRecipeHeaalth.text = viewModel.healthLabels?[0...3].joined(separator: ",")
    }
    


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
