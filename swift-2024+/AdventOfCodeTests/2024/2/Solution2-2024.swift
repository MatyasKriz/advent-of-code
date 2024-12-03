import Foundation

extension AoC_2024 {
    final class Solution2: Solution {
        func solve1(input: String) async throws -> String? {
            let lines = input.lines().map { $0.components(separatedBy: " ").map(\.int) }

            var safeLines = 0

            lineLoop:
            for levels in lines {
                var isIncreasing = false
                var previousLevel: Int?
                for (index, level) in levels.enumerated() {
                    guard previousLevel != level else {
                        continue lineLoop
                    }

                    if let previousLevel, !(1...3).contains(abs(previousLevel - level)) {
                        continue lineLoop
                    }

                    if index == 1 {
                        isIncreasing = previousLevel! < level
                    }

                    if index > 1 {
                        if isIncreasing == (previousLevel! > level) {
                            continue lineLoop
                        }
                    }

                    previousLevel = level
                }
                safeLines += 1
            }

            return safeLines.string
        }

        func solve2(input: String) async throws -> String? {
            let lines = input.lines().map { $0.components(separatedBy: " ").map(\.int) }

            var safeLines = 0

            lineLoop:
            for levels in lines {
                levelsLoop:
                for index in levels.indices {
                    var modifiedLevels = levels
                    modifiedLevels.remove(at: index)

                    var isIncreasing = false
                    var previousLevel: Int?
                    for (index, level) in modifiedLevels.enumerated() {
                        guard previousLevel != level else {
                            continue levelsLoop
                        }

                        if let previousLevel, !(1...3).contains(abs(previousLevel - level)) {
                            continue levelsLoop
                        }

                        if index == 1 {
                            isIncreasing = previousLevel! < level
                        }

                        if index > 1 {
                            if isIncreasing == (previousLevel! > level) {
                                continue levelsLoop
                            }
                        }

                        previousLevel = level
                    }

                    safeLines += 1
                    continue lineLoop
                }
            }

            return safeLines.string
        }
    }
}
