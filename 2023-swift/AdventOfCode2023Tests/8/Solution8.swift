import Foundation
import OrderedCollections

final class Solution8: Solution {
    enum Direction {
        case left
        case right

        init(character: Character) {
            switch String(character) {
            case "L":
                self = .left
            case "R":
                self = .right
            default:
                fatalError()
            }
        }
    }

    func solve1(input: String) async throws -> String? {
        let (directionsInput, mapInput) = input.components(separatedBy: "\n\n").tuple()

        let mappingRegex = /(?<source>\w{3}) = \((?<left>\w{3}), (?<right>\w{3})\)/

        let directions = directionsInput.map(Direction.init)
        let map = try mapInput.lines().reduce(into: [:] as [String: (left: String, right: String)]) { partialResult, line in
            let match = try mappingRegex.wholeMatch(in: line)!
            partialResult[String(match.source)] = (left: String(match.left), right: String(match.right))
        }

        var stepCount = 0
        var node = "AAA"
        var directionIndex = 0
        while node != "ZZZ" {
            let (left, right) = map[node]!
            switch directions[directionIndex] {
            case .left:
                node = left
            case .right:
                node = right
            }
            directionIndex = (directionIndex + 1) % directions.count
            stepCount += 1
        }

        return String(stepCount)
    }

    func solve2(input: String) async throws -> String? {
        let (directionsInput, mapInput) = input.components(separatedBy: "\n\n").tuple()

        let mappingRegex = /(?<source>\w{3}) = \((?<left>\w{3}), (?<right>\w{3})\)/

        let directions = directionsInput.map(Direction.init)
        let map = try mapInput.lines().reduce(into: [:] as [String: (left: String, right: String)]) { partialResult, line in
            let match = try mappingRegex.wholeMatch(in: line)!
            partialResult[String(match.source)] = (left: String(match.left), right: String(match.right))
        }

        var stepCount = 0
        var previousEndingNodeCount = 0
        var nodes = map.keys.filter { $0.hasSuffix("A") }
        var solvedIndices: [Int: Int] = [:]
        var directionIndex = 0
        while solvedIndices.count != nodes.count {
            let direction = directions[directionIndex]
            stepCount += 1
            directionIndex = (directionIndex + 1) % directions.count

            for index in nodes.indices where !solvedIndices.keys.contains(index) {
                let (left, right) = map[nodes[index]]!
                switch direction {
                case .left:
                    nodes[index] = left
                case .right:
                    nodes[index] = right
                }
                let nextNode = nodes[index]
                if nextNode.hasSuffix("Z") {
                    solvedIndices[index] = stepCount
                }
            }
        }

        let values = solvedIndices.values
        let lcm = values.reduce(values.first!, lcm)

        return String(lcm)
    }
}

// Taken from https://gist.github.com/aniltv06/6f3e9c6208e27a89259919eeb3c3d703
/*
 Returns the Greatest Common Divisor of two numbers.
 */
func gcd(_ x: Int, _ y: Int) -> Int {
    var a = 0
    var b = max(x, y)
    var r = min(x, y)

    while r != 0 {
        a = b
        b = r
        r = a % b
    }
    return b
}

/*
 Returns the least common multiple of two numbers.
 */
func lcm(_ x: Int, _ y: Int) -> Int {
    return x / gcd(x, y) * y
}
