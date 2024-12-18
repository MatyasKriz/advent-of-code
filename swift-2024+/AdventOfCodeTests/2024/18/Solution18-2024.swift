import Foundation
import Collections

extension AoC_2024 {
    final class Solution18: Solution {
        struct Node: Comparable {
            struct Point: Hashable {
                var x, y: Int
            }
            var point: Point
            var distance: Int

            static func < (lhs: AoC_2024.Solution18.Node, rhs: AoC_2024.Solution18.Node) -> Bool {
                lhs.distance < rhs.distance
            }
        }

        func solve1(metadata: Metadata, input: String) async throws -> String? {
            let size = metadata["size"] as! Int
            let prefix = metadata["prefix"] as! Int

            let positions = input.lines().prefix(prefix).map { $0.components(separatedBy: ",").tuple() }
            var map: [[Int?]] = Array(repeating: Array(repeating: Int.max, count: size), count: size)
            map[0][0] = 0

            for (x, y) in positions {
                map[y.int][x.int] = nil
            }

            return try await shortestDistanceToExit(map: map).string
        }

        func solve2(metadata: Metadata, input: String) async throws -> String? {
            let size = metadata["size"] as! Int
            let prefix = metadata["prefix"] as! Int

            let positions = input.lines().map { $0.components(separatedBy: ",").tuple() }
            var map: [[Int?]] = Array(repeating: Array(repeating: Int.max, count: size), count: size)
            map[0][0] = 0

            for (x, y) in positions.prefix(prefix) {
                map[y.int][x.int] = nil
            }

            let safeMap = map

            let unsafePositions = Array(positions.dropFirst(prefix))

            var minIndex = 0
            var maxIndex = unsafePositions.count - 1
            while true {
                let searchIndex = minIndex + (maxIndex - minIndex) / 2
                var searchMap = safeMap
                let searchPositions = unsafePositions.prefix(searchIndex)
                for (x, y) in searchPositions {
                    searchMap[y.int][x.int] = nil
                }

                let isBlocked = try await shortestDistanceToExit(map: searchMap) == Int.max

                if isBlocked {
                    if minIndex == searchIndex, let position = searchPositions.last {
                        return "\(position.first),\(position.second)"
                    } else {
                        maxIndex = searchIndex - 1
                    }
                } else {
                    minIndex = searchIndex + 1
                }
            }

            return "unfortunate"
        }

        // Dijkstra's shortest path algorithm.
        private func shortestDistanceToExit(map: [[Int?]]) async throws -> Int {
            var map = map
            var heap = Heap<Node>([Node(point: Node.Point(x: 0, y: 0), distance: 0)])

            var visited: Set<Node.Point> = []
            while let node = heap.popMin(), !visited.contains(node.point) {
                let point = node.point
                visited.insert(point)

                let adjacentPoints = [
                    Node.Point(x: point.x - 1, y: point.y),
                    Node.Point(x: point.x + 1, y: point.y),
                    Node.Point(x: point.x, y: point.y - 1),
                    Node.Point(x: point.x, y: point.y + 1),
                ]
                for adjacentPoint in adjacentPoints {
                    guard let inBoundsDistance = map[safe: adjacentPoint.y]?[safe: adjacentPoint.x] ?? nil else { continue }
                    let newDistance = map[point.y][point.x]! + 1
                    if newDistance < inBoundsDistance {
                        map[adjacentPoint.y][adjacentPoint.x] = newDistance
                        heap.insert(Node(point: adjacentPoint, distance: newDistance))
                    }
                }
            }

            return map.last!.last!!
        }
    }
}
