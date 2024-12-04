import Foundation
import Atomics

extension AoC_2024 {
    final class Solution4: Solution {
        struct Point: Hashable {
            let x: Int
            let y: Int

            let character: Character
        }

        func solve1(input: String) async throws -> String? {
            let lines = input.lines()
            let grid: [[Point]] = lines.enumerated().map { y, line in
                line.enumerated().map { x, character in
                    Point(x: x, y: y, character: character)
                }
            }

            let word = "XMAS"

            func searchForWord(point: Point) -> Int {
                guard point.character == word.first else { return 0 }

                return OmniRange.all(origin: OmniRange.Point(x: point.x, y: point.y), length: word.count)
                    .map { range in
                        String(grid[range].map(\.character))
                    }
                    .reduce(into: 0) { foundWords, text in
                        if text == word {
                            foundWords += 1
                        }
                    }
            }

            return await withTaskGroup(of: Int.self, returning: Int.self) { group in
                for line in grid {
                    for point in line {
                        group.addTask { searchForWord(point: point) }
                    }
                }

                var foundWords = 0
                for await searchResult in group {
                    foundWords += searchResult
                }

                return foundWords
            }
            .string
        }

        func solve2(input: String) async throws -> String? {
            let lines = input.lines()
            let grid: [[Point]] = lines.enumerated().map { y, line in
                line.enumerated().map { x, character in
                    Point(x: x, y: y, character: character)
                }
            }

            func searchForWord(point: Point) -> Int {
                guard point.character == "A" else { return 0 }

                return [
                    OmniRange(origin: OmniRange.Point(x: point.x - 1, y: point.y - 1), length: 3, direction: .downRight),
                    OmniRange(origin: OmniRange.Point(x: point.x - 1, y: point.y + 1), length: 3, direction: .upRight),
                ]
                .map { range in
                    String(grid[range].map(\.character))
                }
                .allSatisfy { text in
                    ["SAM", "MAS"].contains(text)
                } ? 1 : 0
            }

            return await withTaskGroup(of: Int.self, returning: Int.self) { group in
                for line in grid {
                    for point in line {
                        group.addTask { searchForWord(point: point) }
                    }
                }

                var foundWords = 0
                for await searchResult in group {
                    foundWords += searchResult
                }

                return foundWords
            }
            .string
        }
    }
}
