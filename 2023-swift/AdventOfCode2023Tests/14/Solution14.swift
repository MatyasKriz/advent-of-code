import Foundation

final class Solution14: Solution {
    struct Point: Hashable {
        var x: Int, y: Int
    }

    func solve1(input: String) async throws -> String? {
        let lines = input.lines()
        var finalPositions: [Point] = []

        for columnIndex in 0..<lines[0].count {
            var rocksSeen = 0
            var rowIndex = lines.count - 1
            while rowIndex != -1 {
                switch String(lines[rowIndex][columnIndex]) {
                case "#":
                    // Hit bedrock.
                    finalPositions.append(contentsOf: (0..<rocksSeen).map { Point(x: columnIndex, y: rowIndex + 1 + $0) })
                    rocksSeen = 0
                case "O":
                    rocksSeen += 1
                case ".":
                    break
                default:
                    fatalError()
                }
                rowIndex -= 1
            }
            if rocksSeen > 0 {
                finalPositions.append(contentsOf: (0..<rocksSeen).map { Point(x: columnIndex, y: $0) })
            }
        }

        let weights = finalPositions.map { lines.count - $0.y }
        print(weights)
        return String(weights.sum())
    }

    func solve2(input: String) async throws -> String? {
        nil
    }
}
