import Foundation

extension AoC_2024 {
    final class Solution7: Solution {
        enum Operation: Hashable {
            case add
            case multiply
            case concatenate

            func apply(lhs: Int, rhs: Int) -> Int {
                switch self {
                case .add:
                    lhs + rhs
                case .multiply:
                    lhs * rhs
                case .concatenate:
                    Int(String(lhs) + String(rhs))!
                }
            }
        }

        func solve1(input: String) async throws -> String? {
            let tests = input.lines().map { line in
                let (result, operandString) = line.components(separatedBy: ": ").tuple()
                return (result.int, operandString.components(separatedBy: " ").map(\.int))
            }


            func operationCombinations(count: Int) -> [[Operation]] {
                if count == 1 {
                    // [[+], [*]]
                    return [[.add], [.multiply]]
                } else {
                    // [[+, +], [*, +], [+, *], [*, *]]
                    // [[+, +, +], [*, +, +], [+, *, +], [*, *, +], [+, +, *], [*, +, *], [+, *, *], [*, *, *]]
                    return operationCombinations(count: count - 1).flatMap { operations in
                        [
                            operations + [.add],
                            operations + [.multiply],
                        ]
                    }
                }
            }

            var returnedResult = 0
            for (result, operands) in tests {
                let operationSets = operationCombinations(count: operands.count - 1)
                for operations in operationSets {
                    var reducer = operands[0]
                    for (index, operand) in operands.dropFirst().enumerated() {
                        reducer = operations[index].apply(lhs: reducer, rhs: operand)
                    }

                    if reducer == result {
                        returnedResult += result
                        break
                    }
                }
            }
            return returnedResult.string
        }

        func solve2(input: String) async throws -> String? {
            let tests = input.lines().map { line in
                let (result, operandString) = line.components(separatedBy: ": ").tuple()
                return (result.int, operandString.components(separatedBy: " ").map(\.int))
            }

            func operationCombinations(count: Int) -> [[Operation]] {
                if count == 1 {
                    return [[.add], [.multiply], [.concatenate]]
                }

                return operationCombinations(count: count - 1).flatMap { operations in
                    [
                        operations + [.add],
                        operations + [.multiply],
                        operations + [.concatenate],
                    ]
                }
            }

            var returnedResult = 0
            for (result, operands) in tests {
                let operationSets = operationCombinations(count: operands.count - 1)
                for operations in operationSets {
                    var reducer = operands[0]
                    for (index, operand) in operands.dropFirst().enumerated() {
                        reducer = operations[index].apply(lhs: reducer, rhs: operand)
                    }

                    if reducer == result {
                        returnedResult += result
                        break
                    }
                }
            }
            return returnedResult.string
        }
    }
}
