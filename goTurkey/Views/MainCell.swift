//
//  MainCell.swift
//  goTurkey
//
//  Created by Ozgur Hayat on 01/07/2020.
//  Copyright © 2020 Ozgur Hayat. All rights reserved.
//

import UIKit


class MainCell: UITableViewCell {

    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var mainTitle: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainImg.layer.cornerRadius = 14
    }
    
    func configure(category: CityCategory) {
        mainImg.image = UIImage(named: category.imageName)
        mainTitle.text = category.title
        
    }
}

