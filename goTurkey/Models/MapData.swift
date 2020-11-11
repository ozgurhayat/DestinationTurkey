//
//  MapData.swift
//  goTurkey
//
//  Created by Ozgur Hayat on 23/09/2020.
//  Copyright © 2020 Ozgur Hayat. All rights reserved.
//

import Foundation

var data: [Maps] = [
    Maps(city: "Istanbul", long: 28.9784,lat: 41.0082),
    Maps(city: "Alacati", long: 26.3778, lat: 38.2887),
    Maps(city: "Bodrum", long: 27.4305, lat: 37.0344),
    Maps(city: "Antalya", long: 30.7133, lat: 36.8969),
    Maps(city: "Cappadocia", long: 35.0911, lat: 38.3535),
    Maps(city: "Izmir", long: 27.1428, lat: 38.4237),
    Maps(city: "Trabzon", long: 39.7168, lat: 41.0027),
    Maps(city: "GobekliTepe", long: 39.7168, lat: 38.9224)
]

var selectedRow = 0

class Maps {
    var city: String
    var long: Double
    var lat : Double
    
    init(city: String, long: Double, lat: Double) {
        self.city = city
        self.long = long
        self.lat = lat
    }
}


