//
//  SearchDropDownCell.swift
//  IOS Task-Softxpert
//
//  Created by Abeer Meckawi on 01/08/2021.
//

import UIKit
import DropDown

class SearchDropDownCell: DropDownCell {

    @IBOutlet var imgSearchHistory: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imgSearchHistory.contentMode = .scaleAspectFill
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
