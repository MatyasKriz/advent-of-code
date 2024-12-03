import Foundation

final class Solution5: Solution {
    final class Stack: CustomStringConvertible {
        var description: String {
            "[\(elements.map { String($0) }.joined(separator: ", "))]"
        }

        var elements: [Character] = []

        var top: Character? {
            elements.last
        }

        func set(elements: [Character]) {
            self.elements = elements
        }

        func insert(_ element: Character) {
            elements.insert(element, at: 0)
        }

        func push(_ element: Character) {
            elements.append(element)
        }

        func push(_ elements: [Character]) {
            self.elements.append(contentsOf: elements)
        }

        func pop() -> Character? {
            elements.popLast()
        }

        func pop(count: Int) -> [Character] {
            let popped = elements.suffix(count)
            elements.removeLast(count)
            return Array(popped)
        }
    }

    func solveFirst(input: String) async throws -> String {
        let components = input.components(separatedBy: "\n\n")

        let stackLines = components[0]
            .components(separatedBy: "\n")
            .filter { !$0.trimmed.isEmpty }

        var stacks: [Stack] = []
        for stackIndex in stride(from: 1, to: stackLines.last!.count, by: 4) {
            let stack = Stack()
            for rowIndex in 0..<(stackLines.count - 1) {
                let character = stackLines[rowIndex][safe: stackIndex]
                if let character, !character.isWhitespace {
                    stack.insert(character)
                }
            }
            stacks.append(stack)
        }

        for instruction in components[1].components(separatedBy: "\n").filter({ !$0.trimmed.isEmpty }) {
            let match = try! /move (?<count>\d+) from (?<source>\d+) to (?<target>\d+)/
                .wholeMatch(in: instruction)!

            let movedBlocks = stacks[Int(match.source)! - 1].pop(count: Int(match.count)!)
            stacks[Int(match.target)! - 1].push(movedBlocks.reversed())
        }

        return String(stacks.compactMap { $0.top })
    }

    func solveSecond(input: String) async throws -> String {
        let components = input.components(separatedBy: "\n\n")

        let stackLines = components[0]
            .components(separatedBy: "\n")
            .filter { !$0.trimmed.isEmpty }

        var stacks: [Stack] = []
        for stackIndex in stride(from: 1, to: stackLines.last!.count, by: 4) {
            let stack = Stack()
            for rowIndex in 0..<(stackLines.count - 1) {
                let character = stackLines[rowIndex][safe: stackIndex]
                if let character, !character.isWhitespace {
                    stack.insert(character)
                }
            }
            stacks.append(stack)
        }

        for instruction in components[1].components(separatedBy: "\n").filter({ !$0.trimmed.isEmpty }) {
            let match = try! /move (?<count>\d+) from (?<source>\d+) to (?<target>\d+)/
                .wholeMatch(in: instruction)!

            let movedBlocks = stacks[Int(match.source)! - 1].pop(count: Int(match.count)!)
            stacks[Int(match.target)! - 1].push(movedBlocks)
        }

        return String(stacks.compactMap { $0.top })
    }
}
