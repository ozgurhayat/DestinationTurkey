//
//  DestinationCell.swift
//  goTurkey
//
//  Created by Ozgur Hayat on 29/06/2020.
//  Copyright © 2020 Ozgur Hayat. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {

    
    @IBOutlet weak var categoryImg: UIImageView!
    @IBOutlet weak var categoryTitle: UILabel!
    @IBOutlet weak var mapButton: UIButton!
    
        
    override func awakeFromNib() {
        super.awakeFromNib()
        categoryImg.layer.cornerRadius = 14
        
    }

    func configureCell(category: CityCategory) {
        categoryImg.image = UIImage(named: category.imageName)
        categoryTitle.text = category.title
    }

}

