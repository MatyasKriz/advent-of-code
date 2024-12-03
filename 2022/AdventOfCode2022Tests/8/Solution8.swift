import Foundation

final class Solution8: Solution {
    struct Tree: Hashable {
        let height: Int

        let x: Int
        let y: Int
    }


    func solveFirst(input: String) async throws -> String {
        var visibleTrees: Set<Tree> = []
        let lines = input.components(separatedBy: "\n")
        let width = lines.first!.count
        let height = lines.count
        let trees: [Tree] = lines.enumerated().flatMap { y, line in
            line.enumerated().map { x, height in
                Tree(height: Int(String(height))!, x: x, y: y)
            }
        }

        let leftToRight = trees.chunks(ofCount: width).map(Array.init)
        let rightToLeft = Array(trees.chunks(ofCount: width).map { Array($0.reversed()) })
        let topToBottom = (0..<width).map { offset in
            (0..<height).map { trees[$0 * height + offset] }
        }
        let bottomToTop = (0..<width).map { offset in
            Array((0..<height).map { trees[$0 * height + offset] }.reversed())
        }

        visibleTrees.formUnion(visibleTreeSet(in: leftToRight))
        visibleTrees.formUnion(visibleTreeSet(in: rightToLeft))
        visibleTrees.formUnion(visibleTreeSet(in: topToBottom))
        visibleTrees.formUnion(visibleTreeSet(in: bottomToTop))

        return String(visibleTrees.count)
    }

    private func visibleTreeSet(in treeLines: [[Tree]]) -> Set<Tree> {
        var visibleTrees: Set<Tree> = []
        for treeLine in treeLines {
            visibleTrees.formUnion(visibleTreeSet(in: treeLine))
        }
        return visibleTrees
    }

    private func visibleTreeSet(in treeLine: [Tree]) -> Set<Tree> {
        var visibleTrees: Set<Tree> = [treeLine[0]]
        var maximumHeight = treeLine[0].height
        for tree in treeLine.dropFirst() {
            if tree.height > maximumHeight {
                visibleTrees.insert(tree)
                maximumHeight = tree.height
            }
        }
        return visibleTrees
    }

    func solveSecond(input: String) async throws -> String {
        throw TO.DO
    }
}
