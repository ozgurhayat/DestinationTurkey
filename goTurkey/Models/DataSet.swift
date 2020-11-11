//
//  DataSet.swift
//  goTurkey
//
//  Created by Ozgur Hayat on 29/06/2020.
//  Copyright © 2020 Ozgur Hayat. All rights reserved.
//

import Foundation

struct CityCategory {
    var title : String
    var imageName : String
}

struct DataSet {
    var menuCategory = [
        CityCategory(title: "Destinations", imageName: "destinations0"),
        CityCategory(title: "Attractions", imageName: "attractions0"),
//        CityCategory(title: "Cycling", imageName: "cycling0"),
        CityCategory(title: "Gastronomy", imageName: "gastronomy0"),
//        CityCategory(title: "Health and Wellness", imageName: "health0"),
        CityCategory(title: "Videos", imageName: "antalya0"),
        CityCategory(title: "Restaurants", imageName: "restaurants")
    ]
    
    var mainCategory = [
        CityCategory(title: "Istanbul: The Emperial Capital", imageName: "istanbul0"),
        CityCategory(title: "Alacati: Dance With the Wind", imageName: "alacati0"),
        CityCategory(title: "Bodrum: Loggerhead Turtles Nesting Ground", imageName: "bodrum0"),
        CityCategory(title: "Antalya: The Tourism Capital", imageName: "antalya"),
        CityCategory(title: "Cappadocia: Fairy Chimneys Beyond Dreams", imageName: "cappadocia0"),
        CityCategory(title: "Izmir: Pearl of the Aegean", imageName: "izmir0"),
        CityCategory(title: "Trabzon: An Inspiration for Travellers", imageName: "trabzon0"),
        CityCategory(title: "GobekliTepe: The first Temple of the World", imageName: "gobek0")
    ]
    
    func getInformations(forCategoryTitle title:String) -> [Informations] {
        switch title {
        case "Istanbul: The Emperial Capital":
            return istanbul
        case "Alacati: Dance With the Wind":
            return alacati
        case "Bodrum: Loggerhead Turtles Nesting Ground":
            return bodrum
        case "Antalya: The Tourism Capital":
            return antalya
        case "Cappadocia: Fairy Chimneys Beyond Dreams":
            return cappadocia
        case "Izmir: Pearl of the Aegean":
            return izmir
        case "Trabzon: An Inspiration for Travellers":
            return trabzon
        case "GobekliTepe: The first Temple of the World":
            return gobeklitepe
        default:
            return istanbul
        }
    }
}
