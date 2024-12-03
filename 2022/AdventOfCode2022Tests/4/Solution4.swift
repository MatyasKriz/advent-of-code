import Foundation

final class Solution4: Solution {
    func solveFirst(input: String) async throws -> String {
        let redundantElves = input.components(separatedBy: "\n")
            .map { pair in
                let pairArray = pair.components(separatedBy: ",")
                let lhs = Set(range(from: pairArray[0]))
                let rhs = Set(range(from: pairArray[1]))

                return lhs.subtracting(rhs).isEmpty || rhs.subtracting(lhs).isEmpty
            }
            .map { $0 ? 1 : 0 }
            .reduce(0, +)

        return String(redundantElves)
    }

    func solveSecond(input: String) async throws -> String {
        let overlappedElves = input.components(separatedBy: "\n")
            .map { pair in
                let pairArray = pair.components(separatedBy: ",")
                let lhs = Set(range(from: pairArray[0]))
                let rhs = Set(range(from: pairArray[1]))

                return !lhs.intersection(rhs).isEmpty
            }
            .map { $0 ? 1 : 0 }
            .reduce(0, +)

        return String(overlappedElves)
    }

    private func range(from string: String) -> ClosedRange<Int> {
        let bounds = string.components(separatedBy: "-")
        return Int(bounds[0])!...Int(bounds[1])!
    }
}
