//: Playground - noun: a place where people can play

import UIKit
import Foundation

var str = "Hello, playground"

var nearestOddSquare = 3

let input = 277678

for i in stride(from: 3, to: input, by: 2) {
    let square = i*i
    if (square > input) {
        nearestOddSquare = i
        break
    }
}

let nearestSquaredDistanceFromCenter = nearestOddSquare - 1
let nearestSquaredDistance = nearestOddSquare * nearestOddSquare
let stepsToNearestSquare = nearestSquaredDistance - input

let answer = nearestSquaredDistanceFromCenter - stepsToNearestSquare
