//
//  CyclingModel.swift
//  goTurkey
//
//  Created by Ozgur Hayat on 28/10/2020.
//  Copyright © 2020 Ozgur Hayat. All rights reserved.
//

import UIKit

struct AttractionItems {
    let title: String
    let detail: String
    let image: UIImage?
    
    static let gastronomyItems: [AttractionItems] = [
        .init(title: "Local Produce",
              detail: "The simplest and most basic type of vegetable dish is prepared by slicing a main vegetable such as zucchini or eggplant, combining it with tomatoes, green peppers and onions, and cooking it slowly in butter and its own juices. Since the vegetables that are cultivated in Turkey are truly delicious, a simple dish like this, eaten with a sizeable chunk of fresh bread, is a satisfying meal in itself.",
              image: UIImage(named: "gastronomy1")),
        .init(title: "Seafood: Everyday is a fresh catch",
              detail: "Grilling fish over charcoal, where the fish juices hit the embers and envelope the fish with the smoke, is perhaps the most delicious way of eating mature fish since this method brings out the delicate flavour. This is also why the grilled fish sold by vendors right on their boats is so tasty.",
              image: UIImage(named: "gastronomy2")),
        .init(title: "Grilled Meats: Fell the smoke of the BBQ",
              detail: "Given the numerous types of kebabs, we see that they are categorized by the way the meat is cooked. Many people know şiş kebab and döner. Şiş kebab is grilled cubes of skewered meat. Döner kebab is made by stacking alternating layers of ground meat and sliced leg of lamb on a large upright skewer, which is slowly rotated in front of a vertical grill. As the outer layer of the meat is roasted, thin slices are shaved off and served.",
              image: UIImage(named: "gastronomy3")),
        .init(title: "Beverages Beyond Turkish Coffee and Ayran",
              detail: "Volumes have been written about Turkish coffee; its history, its significance in social life, and the ambiance of the ubiquitous coffee houses. Tea, on the other hand, is the main source of caffeine for the Turks. It is prepared in a special way, by brewing it over boiling water and served in delicate, small, clear glasses to show the deep red colour and to transmit the heat to the hand.",
              image: UIImage(named: "gastronomy4")),
        .init(title: "Meze: Dishes to Accompany the Spirits",
              detail: "Drinking alcoholic beverages in the company of family and friends at home as well as in taverns and restaurants is a part of special occasions. Similar to the Spanish tapas, meze is the general category of dishes that are brought in small quantities to start the meal off.",
              image: UIImage(named: "gastronomy5"))
    ]

    static let attractionMain: [AttractionItems] = [
        .init(title: "Sea and Nature",
              detail: "Whether it's 18 holes on a golf course, watersports, camping, hiking, canyoning, or relaxing on golden beaches, no matter what the season. You can’t go wrong when coming to Turkey.",
              image: UIImage(named: "attraction1")),
        .init(title: "Culture",
              detail: "From Unesco sites to traditional craftsmanship. From iconic religious buildings to the arts and crafts of the Grand Bazaar, Turkey is drenched in the richness of everything that is cultural.",
              image: UIImage(named: "attraction2")),
        .init(title: "Gastronomy",
              detail: "Fresh local natural produce makes Turkey the ideal place to get your palette trying new flavours. Authentic Ottoman cuisine, the perfect assortment of grilled meat, fresh seafood and not to forget the rich honey enriched desserts!",
              image: UIImage(named: "attraction3")),
        .init(title: "History",
              detail: "An ancient story that dates back to the cradle of civilization. An epic journey through centuries of occupation from the Seljuk Empire to modern day Turkey.",
              image: UIImage(named: "attraction4")),
        .init(title: "Religious Tourism",
              detail: "No matter what your faith, Turkey’s history has hosted a myriad of people and many grandiose buildings are scattered all over the country. From ancient temples to modern day mosques.",
              image: UIImage(named: "attraction5"))
    ]
}
