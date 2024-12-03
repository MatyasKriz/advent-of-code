import Foundation

final class Solution1: Solution {
    func solve1(input: String) async throws -> String? {
        let result = input.components(separatedBy: "\n")
            .filter { !$0.isEmpty }
            .map {
                let digits = $0.filter { $0.isWholeNumber }
                return Int(String(digits.first!) + String(digits.last!))!
            }
            .sum()
        return String(result)
    }

    func solve2(input: String) async throws -> String? {
        let result = input.components(separatedBy: "\n")
            .filter { !$0.isEmpty }
            .map { line in
                let wordDigits = ["one": "1", "two": "2", "three": "3", "four": "4", "five": "5", "six": "6", "seven": "7", "eight": "8", "nine": "9"]
                var digits: [String] = []
                var index = 0

                outerLoop: while index < line.count {
                    if line[index].isWholeNumber {
                        digits.append(String(line[index]))
                        index += 1
                    } else {
                        for word in wordDigits {
                            if line[safeRange: index..<(index + word.key.count)] == word.key {
                                digits.append(word.value)
                                index += word.key.count - 1
                                continue outerLoop
                            }
                        }
                        index += 1
                    }
                }

                return Int(digits.first! + digits.last!)!
            }
            .sum()
        return String(result)
    }
}
