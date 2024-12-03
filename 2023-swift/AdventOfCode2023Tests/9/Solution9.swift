import Foundation

final class Solution9: Solution {
    func solve1(input: String) async throws -> String? {
        let sequences = input.lines().map { $0.components(separatedBy: " ").compactMap(Int.init) }

        let sum = await withTaskGroup(of: Int.self, returning: Int.self) { group in
            for sequence in sequences {
                group.addTask {
                    let result = self.getNextDifference(from: sequence) + sequence.last!
                    print(sequence, "->", result)
                    return result
                }
            }

            return await group.reduce(0, +)
        }
        return String(sum)
    }

    private func getNextDifference(from sequence: [Int]) -> Int {
        guard !sequence.allSatisfy({ $0 == 0 }) else { return 0 }
        let differences = sequence.adjacentPairs().map { $1 - $0 }
        return differences.last! + getNextDifference(from: differences)
    }

    func solve2(input: String) async throws -> String? {
        let sequences = input.lines().map { $0.components(separatedBy: " ").compactMap(Int.init) }

        let sum = await withTaskGroup(of: Int.self, returning: Int.self) { group in
            for sequence in sequences {
                group.addTask {
                    let result = sequence.first! - self.getPreviousDifference(from: sequence) 
                    print(sequence, "->", result)
                    return result
                }
            }

            return await group.reduce(0, +)
        }
        return String(sum)
    }

    private func getPreviousDifference(from sequence: [Int]) -> Int {
        guard !sequence.allSatisfy({ $0 == 0 }) else { return 0 }
        let differences = sequence.adjacentPairs().map { $1 - $0 }
        return differences.first! - getPreviousDifference(from: differences)
    }
}
