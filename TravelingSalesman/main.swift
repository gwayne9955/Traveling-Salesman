//
//  main.swift
//  TravelingSalesman
//
//  Created by Garrett Wayne on 4/21/18.
//  Copyright © 2018 Garrett Wayne. All rights reserved.
//

import Foundation

var cities = [City]()

var c1 = City(name: "Miami", lat: 41.24, long: -4.1)
var c2 = City(name: "Denver", lat: 6.121, long: 22.98)
var c3 = City(name: "Los Angeles", lat: -11.241, long: -3.22)
var c4 = City(name: "Seattle", lat: -1, long: 12.134)

cities = [c1, c2, c3, c4]

printCities(cities: findShortestRoute(cities: cities))

