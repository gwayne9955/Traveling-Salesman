//
//  main.swift
//  TravelingSalesman
//
//  Created by Garrett Wayne on 4/21/18.
//  Copyright © 2018 Garrett Wayne. All rights reserved.
//

import Foundation

var cities = [City]()

var c1 = City(name: "Miami", lat: 25.76168, long: -80.19179)
var c2 = City(name: "Denver", lat: 39.739236, long: -104.990251)
var c3 = City(name: "Los Angeles", lat: 34.052234, long: -118.243685)
var c4 = City(name: "Seattle", lat: 47.60621, long: -122.332071)
var c5 = City(name: "Chicago", lat: 41.878114, long: -87.629798)
var c6 = City(name: "New York", lat: 40.712775, long: -74.005973)

cities = [c1, c2, c3, c4, c5]

printCities(cities: findShortestRoute(cities: cities))

