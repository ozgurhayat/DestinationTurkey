//
//  RecipeCell.swift
//  goTurkey
//
//  Created by Ozgur Hayat on 29/06/2020.
//  Copyright © 2020 Ozgur Hayat. All rights reserved.
//

import UIKit

class CityCell: UICollectionViewCell {
    
    @IBOutlet weak var locationImg: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        locationImg.layer.cornerRadius = 14
    }
    
    func configureCell(location: Informations) {
        locationImg.image = UIImage(named: location.imageName)
    }
}
