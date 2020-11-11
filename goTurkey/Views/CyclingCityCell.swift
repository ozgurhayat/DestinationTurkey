//
//  CyclingCityCell.swift
//  goTurkey
//
//  Created by Ozgur Hayat on 28/10/2020.
//  Copyright © 2020 Ozgur Hayat. All rights reserved.
//

import UIKit


class CyclingCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cyclingTitleLabel: UILabel!
    @IBOutlet weak var cyclingDetailLabel: UILabel!
    
    func cyclingCityConfigure(with item: AttractionItems) {
        cyclingTitleLabel.text = item.title
        cyclingDetailLabel.text = item.detail
    }
}
