//: Playground - noun: a place where people can play

import UIKit
import Foundation
import PlaygroundSupport


let inputUrl = Bundle.main.url(forResource: "AdventDay7InputSimple", withExtension: ".txt")!
let input = try String(contentsOf: inputUrl)


public func part2Solution(towers: [Tower]) -> Int {
    let towersWithTowers = towers.filter { !$0.towerNamesAbove.isEmpty }
    
    for tower in towersWithTowers {
        let isBalanced = isTowerBalanced(tower: tower, inTowers: towers)
        if (!isBalanced) {
            print("Unbalanced tower is \(tower)")
            let towersInTower = towers.filter { tower.towerNamesAbove.contains($0.name) }
            return findCorrectWeightToBalanceTowers(towers: towersInTower, inAllTowers: towers)
        }
    }
    
    return 0
}

func findCorrectWeightToBalanceTowers(towers: [Tower], inAllTowers allTowers: [Tower]) -> Int {
    print("Looking at towers \(towers)")
    let sortedTowers = towers.sorted {
        findSupportedWeightByTower(tower: $0, inTowers: allTowers) < findSupportedWeightByTower(tower: $1, inTowers: allTowers)
    }
    
    print("Towers sorted by weight are in order \(sortedTowers)")
    
    let heaviestTower = sortedTowers.last!
    let lightestTower = sortedTowers.first!
    
    
    print("Heaviest tower is \(heaviestTower)")
    print("Lightest tower is \(lightestTower)")
    
    if (heaviestTower.weight > lightestTower.weight) {
        return lightestTower.weight
    } else {
        let towersInTower = allTowers.filter { heaviestTower.towerNamesAbove.contains($0.name) }
        return findCorrectWeightToBalanceTowers(towers: towersInTower, inAllTowers: allTowers)
    }
}

func isTowerBalanced(tower: Tower, inTowers towers: [Tower]) -> Bool {
    let towersAbove = towers.filter { tower.towerNamesAbove.contains($0.name) }
    let totalWeightsOfPillars = towersAbove.map {
        return findSupportedWeightByTower(tower: $0, inTowers: towers)
    }
    
    return totalWeightsOfPillars.min()! == totalWeightsOfPillars.max()!
}

func findSupportedWeightByTower(tower: Tower, inTowers towers: [Tower]) -> Int {
    var towerWeight = tower.weight
    let towersAbove = towers.filter { tower.towerNamesAbove.contains($0.name) }
    for towerAbove in towersAbove {
        towerWeight += findSupportedWeightByTower(tower: towerAbove, inTowers: towers)
    }
    
    return towerWeight
}

let towers = inputToTowers(input: input)

//print("Bottom tower is \(findBottomTower(towers: towers).name)")
print("Part 2 solution is \(part2Solution(towers: towers))")

