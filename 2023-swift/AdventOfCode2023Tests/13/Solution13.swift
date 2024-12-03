import Foundation

final class Solution13: Solution {
    func solve1(input: String) async throws -> String? {
        let mirrors = input.components(separatedBy: "\n\n")

        func isMirrored(startIndex: Int, offset: Int, string: String) -> Bool {
            let lhs = string[safe: startIndex - offset]
            let rhs = string[safe: startIndex + offset - 1]
            if lhs == nil || rhs == nil {
                return true
            } else if lhs == rhs {
                return isMirrored(startIndex: startIndex, offset: offset + 1, string: string)
            } else {
                return false
            }
        }

        var result = 0
        mirrorLoop: for (index, mirror) in mirrors.enumerated() {
            let lines = mirror.lines()

            var verticalMirrorIndex: Int?
            outerColumnLoop: for columnIndex in 1..<lines[0].count {
                lineLoop: for line in lines {
                    let isMirrored = isMirrored(startIndex: columnIndex, offset: 1, string: line)
                    if !isMirrored {
                        continue outerColumnLoop
                    }
                }
                verticalMirrorIndex = columnIndex
                break
            }
            if let verticalMirrorIndex {
                result += verticalMirrorIndex
                continue mirrorLoop
            }

            var horizontalMirrorIndex: Int?
            outerRowLoop: for rowIndex in 1..<lines.count {
                for columnIndex in 0..<lines[0].count {
                    let line = String((0..<lines.count).map { lines[$0][columnIndex] })
                    let isMirrored = isMirrored(startIndex: rowIndex, offset: 1, string: line)
                    if !isMirrored {
                        continue outerRowLoop
                    }
                }
                horizontalMirrorIndex = rowIndex
                break
            }
            if let horizontalMirrorIndex {
                result += horizontalMirrorIndex * 100
                continue mirrorLoop
            }

            print("Failed to find reflection for mirror \(index)")
            print(mirror)
        }

        return String(result)
    }

    func solve2(input: String) async throws -> String? {
        let mirrors = input.components(separatedBy: "\n\n")

        func isMirrored(startIndex: Int, offset: Int, string: String, hasFixedSmudge: inout Bool) -> Bool {
            let lhs = string[safe: startIndex - offset]
            let rhs = string[safe: startIndex + offset - 1]
            if lhs == nil || rhs == nil {
                return true
            } else if lhs == rhs {
                return isMirrored(startIndex: startIndex, offset: offset + 1, string: string, hasFixedSmudge: &hasFixedSmudge)
            } else {
                if hasFixedSmudge {
                    return false
                } else {
                    hasFixedSmudge = true
                    return isMirrored(startIndex: startIndex, offset: offset + 1, string: string, hasFixedSmudge: &hasFixedSmudge)
                }
            }
        }

        var result = 0
        mirrorLoop: for (index, mirror) in mirrors.enumerated() {
            let lines = mirror.lines()

            var verticalMirrorIndex: Int?
            outerColumnLoop: for columnIndex in 1..<lines[0].count {
                var hasFixedSmudge = false
                lineLoop: for line in lines {
                    let isMirrored = isMirrored(startIndex: columnIndex, offset: 1, string: line, hasFixedSmudge: &hasFixedSmudge)
                    if !isMirrored {
                        continue outerColumnLoop
                    }
                }
                if hasFixedSmudge {
                    verticalMirrorIndex = columnIndex
                    break
                }
            }
            if let verticalMirrorIndex {
                result += verticalMirrorIndex
                continue mirrorLoop
            }

            var horizontalMirrorIndex: Int?
            outerRowLoop: for rowIndex in 1..<lines.count {
                var hasFixedSmudge = false
                for columnIndex in 0..<lines[0].count {
                    let line = String((0..<lines.count).map { lines[$0][columnIndex] })
                    let isMirrored = isMirrored(startIndex: rowIndex, offset: 1, string: line, hasFixedSmudge: &hasFixedSmudge)
                    if !isMirrored {
                        continue outerRowLoop
                    }
                }
                if hasFixedSmudge {
                    horizontalMirrorIndex = rowIndex
                    break
                }
            }
            if let horizontalMirrorIndex {
                result += horizontalMirrorIndex * 100
                continue mirrorLoop
            }

            print("Failed to find reflection for mirror \(index)")
            print(mirror)
        }

        return String(result)
    }
}
