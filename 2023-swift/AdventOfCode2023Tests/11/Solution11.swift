import Foundation

final class Solution11: Solution {
    struct Point: Hashable {
        var x: Int, y: Int
    }

    func solve1(input: String) async throws -> String? {
        let lines = input.lines()
        let width = lines[0].count
        let height = lines.count

        var emptyRowIndices: Set<Int> = []
        for (index, line) in lines.enumerated() {
            if line == String(repeating: ".", count: width) {
                emptyRowIndices.insert(index)
            }
        }

        var emptyColumnIndices: Set<Int> = []
        for index in 0..<lines[0].count {
            let line = String((0..<height).map { lines[$0][index] })
            if line == String(repeating: ".", count: height) {
                emptyColumnIndices.insert(index)
            }
        }

        var stars: [Point] = []
        for (rowIndex, line) in lines.enumerated() {
            for (columnIndex, character) in line.enumerated() {
                if String(character) == "#" {
                    stars.append(Point(x: columnIndex, y: rowIndex))
                }
            }
        }

        let emptyColumnIndicesSnapshot = emptyColumnIndices
        let emptyRowIndicesSnapshot = emptyRowIndices
        let distances = await withTaskGroup(of: Int.self, returning: Int.self) { group in
            for sourceIndex in 0..<(stars.count - 1) {
                for targetIndex in (sourceIndex + 1)..<stars.count {
                    let source = stars[sourceIndex]
                    let target = stars[targetIndex]
                    group.addTask {
                        let distanceX = (min(source.x, target.x)..<max(source.x, target.x))
                            .map { emptyColumnIndicesSnapshot.contains($0) ? 2 : 1 }
                            .sum()
                        let distanceY = (min(source.y, target.y)..<max(source.y, target.y))
                            .map { emptyRowIndicesSnapshot.contains($0) ? 2 : 1 }
                            .sum()
                        return distanceX + distanceY
                    }
                }
            }

            return await group.reduce(0, +)
        }

        return String(distances)
    }

    func solve2(input: String) async throws -> String? {
        let lines = input.lines()
        let width = lines[0].count
        let height = lines.count

        var emptyRowIndices: Set<Int> = []
        for (index, line) in lines.enumerated() {
            if line == String(repeating: ".", count: width) {
                emptyRowIndices.insert(index)
            }
        }

        var emptyColumnIndices: Set<Int> = []
        for index in 0..<lines[0].count {
            let line = String((0..<height).map { lines[$0][index] })
            if line == String(repeating: ".", count: height) {
                emptyColumnIndices.insert(index)
            }
        }

        var stars: [Point] = []
        for (rowIndex, line) in lines.enumerated() {
            for (columnIndex, character) in line.enumerated() {
                if String(character) == "#" {
                    stars.append(Point(x: columnIndex, y: rowIndex))
                }
            }
        }

        let emptyColumnIndicesSnapshot = emptyColumnIndices
        let emptyRowIndicesSnapshot = emptyRowIndices
        let distances = await withTaskGroup(of: Int.self, returning: Int.self) { group in
            for sourceIndex in 0..<(stars.count - 1) {
                for targetIndex in (sourceIndex + 1)..<stars.count {
                    let source = stars[sourceIndex]
                    let target = stars[targetIndex]
                    group.addTask {
                        let distanceX = (min(source.x, target.x)..<max(source.x, target.x))
                            .map { emptyColumnIndicesSnapshot.contains($0) ? 1000000 : 1 }
                            .sum()
                        let distanceY = (min(source.y, target.y)..<max(source.y, target.y))
                            .map { emptyRowIndicesSnapshot.contains($0) ? 1000000 : 1 }
                            .sum()
                        return distanceX + distanceY
                    }
                }
            }

            return await group.reduce(0, +)
        }

        return String(distances)
    }
}
