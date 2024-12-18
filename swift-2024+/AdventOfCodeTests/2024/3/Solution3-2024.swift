import Foundation

extension AoC_2024 {
    final class Solution3: Solution {
        func solve1(metadata: Metadata, input: String) async throws -> String? {
            let regex = /mul\((?<lhs>\d{1,3}),(?<rhs>\d{1,3})\)/
            return input.matches(of: regex)
                .map { match in
                    match.lhs.int * match.rhs.int
                }
                .sum()
                .string
        }

        func solve2(metadata: Metadata, input: String) async throws -> String? {
            let regex = /((?<inst>do\(\)|don't\(\))|(mul\((?<lhs>\d{1,3}),(?<rhs>\d{1,3})\)))/
            var isEnabled = true
            return input.matches(of: regex)
                .reduce(into: 0) { partialResult, match in
                    if let inst = match.inst {
                        if inst == "do()" {
                            isEnabled = true
                        }
                        if inst == "don't()" {
                            isEnabled = false
                        }
                    }
                    if let lhs = match.lhs, let rhs = match.rhs, isEnabled {
                        partialResult += lhs.int * rhs.int
                    }
                }
                .string
        }
    }
}
