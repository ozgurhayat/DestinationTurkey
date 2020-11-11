//
//  QuoteCollectionViewCell.swift
//  goTurkey
//
//  Created by Ozgur Hayat on 20/10/2020.
//  Copyright © 2020 Ozgur Hayat. All rights reserved.
//

import UIKit


class QuoteCollectionViewCell: UICollectionViewCell {
   
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    
    func attractionConfigure(with item: AttractionItems) {
        titleLabel.text = item.title
        detailLabel.text = item.detail
    }

}
