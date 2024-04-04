import UIKit
import Foundation

func calculatePoints(forMatch matchResult: String) -> (Int, Int) {
    let scores = matchResult.split(separator: ":")
    
    guard scores.count == 2,
          let homeScore = Int(scores[0]),
          let awayScore = Int(scores[1]) else {
        return (0, 0)
    }
    
    switch homeScore - awayScore {
    case ..<0:
        return (0, 3)
    case 0:
        return (1, 1)
    default:
        return (3, 0)
    }
}

func calculateTotalPoints(forMatches matches: [String]) -> [Int: Int] {
    var points = [0: 0, 1: 0]
    
    for match in matches {
        let (homePoints, awayPoints) = calculatePoints(forMatch: match)
        points[0]! += homePoints
        points[1]! += awayPoints
    }
    return points
}

// Входные данные
let matches = ["3:1", "2:2", "0:1", "4:2", "3:a", "3-12"]

let totalPoints = calculateTotalPoints(forMatches: matches)

for (team, points) in totalPoints {
    print("Команда №\(team + 1) получила \(points) очков")
}
