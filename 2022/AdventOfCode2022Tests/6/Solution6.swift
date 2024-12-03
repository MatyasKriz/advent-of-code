import Foundation

final class Solution6: Solution {
    func solveFirst(input: String) async throws -> String {
        for index in 0..<input.count {
            if Set(input[index..<(index + 4)]).count == 4 {
                return String(index + 4)
            }
        }

        fatalError()
    }

    func solveSecond(input: String) async throws -> String {
        for index in 0..<input.count {
            if Set(input[index..<(index + 14)]).count == 14 {
                return String(index + 14)
            }
        }

        fatalError()
    }
}
