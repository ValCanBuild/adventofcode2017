import Foundation

public struct Tower {
    public let name: String
    public let weight: Int
    public let towerNamesAbove: [String]
    
    public init(name: String, weight: Int, towersAbove: [String] = []) {
        self.name = name
        self.weight = weight
        self.towerNamesAbove = towersAbove
    }
}

public func inputToTowers(input: String) -> [Tower] {
    let inputLines = input.components(separatedBy: .newlines)
    
    let towers: [Tower] = inputLines.map {
        let stringParts = $0.components(separatedBy: .whitespaces)
        
        let name = stringParts[0]
        
        let weightPart = stringParts[1]
        let start = weightPart.index(after: weightPart.startIndex)
        let end = weightPart.index(before: weightPart.endIndex)
        let weight = Int(weightPart[start..<end])!
        
        var towerNamesAbove: [String] = []
        let hasTowers = stringParts.count > 2
        if hasTowers {
            for i in 3..<stringParts.count {
                let towerName = stringParts[i].replacingOccurrences(of: ",", with: "")
                towerNamesAbove.append(towerName)
            }
        }
        
        return Tower(name: name, weight: weight, towersAbove: towerNamesAbove)
    }
    
    return towers
}

public func findBottomTower(towers: [Tower]) -> Tower {
    let towersWithTowers = towers.filter { !$0.towerNamesAbove.isEmpty }
    
    let bottom = towersWithTowers.first {
        let towerName = $0.name
        let containedAbove = towersWithTowers.first { $0.name != towerName && $0.towerNamesAbove.contains(towerName) } == nil
        return containedAbove
    }
    
    return bottom!
}
