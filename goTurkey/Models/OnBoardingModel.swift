//
//  OnBoardingModel.swift
//  goTurkey
//
//  Created by Ozgur Hayat on 20/10/2020.
//  Copyright © 2020 Ozgur Hayat. All rights reserved.
//

import UIKit

struct OnboardingItem {
    
    let title: String
    let detail: String
    let bgImage: UIImage?
    
    static let placeholderItems: [OnboardingItem] = [
        .init(title: "Discover the very best of Turkey",
              detail: "Explore our ancient history and natural beauty. Immerse yourself into the rich culture whilst experiencing the mouth-watering flavours of Turkish cuisine!",
              bgImage: UIImage(named: "imTravel1")),
        .init(title: "Discover Highlights Of Turkey",
              detail: "Turkey has a lot of great destinations to offer. Exceptional landmarks, wonderful natural sceneries, historical legacies and a rich culture.",
              bgImage: UIImage(named: "imTravel2")),
        .init(title: "Discover Your Way With New Features",
              detail: "While history buffs can enjoy exploring the ruins of ancient cities, nature-lovers find repose breathing the cool, clean air in Turkey",
              bgImage: UIImage(named: "imTravel3")),
        .init(title: "Discover Turkish Cuisine!",
              detail: "Authentic Ottoman cuisine, the perfect assortment of grilled meat, fresh seafood and not to forget the rich honey enriched desserts!",
              bgImage: UIImage(named: "imTravel4"))
    ]
}



