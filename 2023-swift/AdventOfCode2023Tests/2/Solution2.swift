import Foundation

final class Solution2: Solution {
    func solve1(input: String) async throws -> String? {
        let gameRegex = /Game (?<id>\d+)/
        let colorRegex = /(?<count>\d+) (?<color>\w+)/

        let gameAndContentPairs = input.lines()
            .map { line in
                line.components(separatedBy: ":").tuple()
            }
        
        var result = 0
        gameLoop: for pair in gameAndContentPairs {

            let sets = pair.second.components(separatedBy: ";")
            for set in sets {
                var redLeft = 12
                var greenLeft = 13
                var blueLeft = 14
                for match in set.matches(of: colorRegex) {
                    let count = Int(match.count)!
                    switch match.color {
                    case "red":
                        redLeft -= count
                    case "green":
                        greenLeft -= count
                    case "blue":
                        blueLeft -= count
                    default:
                        fatalError()
                    }
                    if redLeft < 0 || greenLeft < 0 || blueLeft < 0 {
                        continue gameLoop
                    }
                }
            }

            result += try Int(gameRegex.wholeMatch(in: pair.first)!.id)!
        }
        return String(result)
    }

    func solve2(input: String) async throws -> String? {
        let colorRegex = /(?<count>\d+) (?<color>\w+)/

        let gameAndContentPairs = input.lines()
            .map { line in
                line.components(separatedBy: ":").tuple()
            }

        var result = 0
        gameLoop: for pair in gameAndContentPairs {
            var minRed = 0
            var minGreen = 0
            var minBlue = 0

            let sets = pair.second.components(separatedBy: ";")
            for set in sets {
                for match in set.matches(of: colorRegex) {
                    let count = Int(match.count)!
                    switch match.color {
                    case "red":
                        minRed = max(minRed, count)
                    case "green":
                        minGreen = max(minGreen, count)
                    case "blue":
                        minBlue = max(minBlue, count)
                    default:
                        fatalError()
                    }
                }
            }

            result += minRed * minGreen * minBlue
        }
        return String(result)
    }
}
