//
//  TravelingSalesman.swift
//  TravelingSalesman
//
//  Created by Garrett Wayne on 4/21/18.
//  Copyright © 2018 Garrett Wayne. All rights reserved.
//

import Foundation

func findShortestRoute(cities: [City]) -> [City] {
    var answer = [City]()
    let len = cities.count
    var shortestDistance = 0.0
    let indexOfStartingCity = 0
    var table = [Double: [Int]]()
    var cityIndexSet = Set<Int>(0...len - 1)
    
    var distMatrix: [[Double]] = Array(repeating: Array(repeating: 0, count: len), count: len)
    generateDistMatrix(matrix: &distMatrix, len: len, cities: cities, citySet: &cityIndexSet)
    
    cityIndexSet.remove(indexOfStartingCity)
    answer.append(cities[indexOfStartingCity])
    
    if len == 2 {
        answer.append(cities[cityIndexSet.first!])
        shortestDistance = 2 * distMatrix[indexOfStartingCity][cityIndexSet.first!]
    }
    
    else if len > 2 {
        shortestDistance = cost(matrix: &distMatrix, len: len, fromIndex: indexOfStartingCity, toIndex: indexOfStartingCity, cityIndexSet: &cityIndexSet, table: &table)
        for index in table[shortestDistance]! {
            answer.append(cities[index])
        }
    }
    print("Shortest Distance is \(shortestDistance)")
    
    answer.append(cities[indexOfStartingCity])
    
    return answer
}

func generateDistMatrix(matrix: inout [[Double]], len: Int, cities: [City], citySet: inout Set<Int>) {
    for i in 0...len-1 {
        for j in 0...len-1 {
            if i == j {
                matrix[i][j] = 0.0
            }
            else {
                matrix[i][j] = getDistanceBetweenCities(c1: cities[i], c2: cities[j])
            }
        }
        cities[i].cityNumber = i
    }
}

func getDistanceBetweenCities(c1: City, c2: City) -> Double {
    var dist: Double = 0.0
    dist = sqrt(pow(c1.lattitude - c2.lattitude, 2) + pow(c1.longitude - c2.longitude, 2))
    return dist
}

func cost(matrix: inout [[Double]], len: Int, fromIndex: Int, toIndex: Int, cityIndexSet: inout Set<Int>, table: inout [Double: [Int]]) -> Double {
    if cityIndexSet.isEmpty {
        return matrix[fromIndex][toIndex]
    }
    var dist = Double.greatestFiniteMagnitude
    
    for index in cityIndexSet {
        var temp = 0.0
        cityIndexSet.remove(index)
        temp = matrix[fromIndex][index] + cost(matrix: &matrix, len: len, fromIndex: index, toIndex: toIndex, cityIndexSet: &cityIndexSet, table: &table)
        if cityIndexSet.count == len - 2 {
            var array = [index] // problem here, debug when temp is the lowest, set is not in right order
            array.append(contentsOf: cityIndexSet)
            if table[temp] == nil {
                table[temp] = array
            }
        }
        cityIndexSet.insert(index)
        if temp < dist {
            dist = temp
        }
    }
    
    return dist
}

func printCities(cities: [City]) {
    print("Shortest Round Trip to All Cities is:")
    for city in cities {
        print(city.name + ", ")
    }
}
