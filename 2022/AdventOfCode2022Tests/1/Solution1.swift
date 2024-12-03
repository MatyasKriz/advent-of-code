import Foundation

final class Solution1: Solution {
    func solveFirst(input: String) async throws -> String {
        let elves = input.components(separatedBy: "\n\n")
        let max = elves
            .map { $0.components(separatedBy: "\n").compactMap { Int($0) }.reduce(0, +) }
            .max()
        return String(max!)
    }

    func solveSecond(input: String) async throws -> String {
        let elves = input.components(separatedBy: "\n\n")
        let max = elves
            .map { $0.components(separatedBy: "\n").compactMap { Int($0) }.reduce(0, +) }
            .sorted()
            .suffix(3)
            .reduce(0, +)
        return String(max)
    }
}
