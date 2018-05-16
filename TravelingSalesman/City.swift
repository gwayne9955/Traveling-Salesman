//
//  City.swift
//  TravelingSalesman
//
//  Created by Garrett Wayne on 4/21/18.
//  Copyright © 2018 Garrett Wayne. All rights reserved.
//

class City {
    var name: String
    var lattitude: Double
    var longitude: Double
    var hasBeenVisited: Bool
    var cityNumber: Int
    
    init(name: String, lat: Double, long: Double) {
        self.name = name
        self.lattitude = lat
        self.longitude = long
        self.hasBeenVisited = false
        self.cityNumber = 0
    }
}
