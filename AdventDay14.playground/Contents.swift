//: Playground - noun: a place where people can play

import UIKit
import Foundation
import PlaygroundSupport



let puzzleInputSimple = "flqrgnkx"
let puzzleInput = "jxqlasbh"


func countNumUsed(_ binaryArray: [String]) -> Int {
    return Int(binaryArray.map { $0.filter { $0 == "1" } }.joined().count)
}


let binaryArray = inputToBinaryStringArray(puzzleInputSimple)
print("Num used squares is \(countNumUsed(binaryArray))")
print("Num regions is \(numRegions(binaryArray))")
