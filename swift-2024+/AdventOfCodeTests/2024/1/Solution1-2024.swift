import Foundation

extension AoC_2024 {
    final class Solution1: Solution {
        func solve1(input: String) async throws -> String? {
            var leftSide: [Int] = []
            var rightSide: [Int] = []
            for (left, right) in input.lines().map({ $0.components(separatedBy: "   ").tuple() }) {
                leftSide.append(left.int)
                rightSide.append(right.int)
            }

            return zip(leftSide.sorted(), rightSide.sorted())
                .map { abs($0 - $1) }
                .reduce(0, +)
                .string
        }

        func solve2(input: String) async throws -> String? {
            var leftSide: [Int] = []
            var rightSide: [Int] = []
            for (left, right) in input.lines().map({ $0.components(separatedBy: "   ").tuple() }) {
                leftSide.append(left.int)
                rightSide.append(right.int)
            }

            return leftSide.reduce(0) { partialResult, left in
                partialResult + left * rightSide.filter { $0 == left }.count
            }
            .string
        }
    }
}
