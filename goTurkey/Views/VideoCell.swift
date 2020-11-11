//
//  VideoTableViewCell.swift
//  goTurkey
//
//  Created by Ozgur Hayat on 22/09/2020.
//  Copyright © 2020 Ozgur Hayat. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var videoImageCell: UIImageView!
    @IBOutlet weak var videoLabelCell: UILabelX!
    
    var video: Video! {
        didSet {
            updateUI()
        }
    }
    
    func updateUI() {
        videoImageCell.image = UIImage(named: video.thumbnailFileName)
        videoLabelCell.text = video.authorName
        videoImageCell.layer.cornerRadius = 14
    }

}
