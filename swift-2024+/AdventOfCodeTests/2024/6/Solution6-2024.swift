import Foundation

extension AoC_2024 {
    final class Solution6: Solution {
        enum Direction {
            case up
            case right
            case down
            case left

            func turn() -> Direction {
                switch self {
                case .up:
                    return .right
                case .right:
                    return .down
                case .down:
                    return .left
                case .left:
                    return .up
                }
            }
        }

        struct Point: Hashable {
            var x, y: Int

            mutating func advance(in direction: Direction) {
                switch direction {
                case .up:
                    y -= 1
                case .right:
                    x += 1
                case .down:
                    y += 1
                case .left:
                    x -= 1
                }
            }
        }

        struct Player: Hashable {
            var position: Point
            var direction: Direction

            var lookahead: Point {
                var mutablePosition = position
                mutablePosition.advance(in: direction)
                return mutablePosition
            }

            mutating func advance() {
                position.advance(in: direction)
            }

            mutating func turn() {
                direction = direction.turn()
            }
        }

        func solve1(input: String) async throws -> String? {
            let map = input.lines().map { $0.map(String.init) }
            let xBounds = 0..<map[0].count
            let yBounds = 0..<map.count

            func isInBounds(point: Point) -> Bool {
                xBounds.contains(point.x)
                && yBounds.contains(point.y)
            }

            var player = Player(position: Point(x: 0, y: 0), direction: .up)
            var obstacles: Set<Point> = []

            outerLoop:
            for (y, line) in map.enumerated() {
                for (x, block) in line.enumerated() {
                    switch block {
                    case "^":
                        player.position = Point(x: x, y: y)
                    case "#":
                        obstacles.insert(Point(x: x, y: y))
                    default:
                        break
                    }
                }
            }

            var path: [Player] = [player]
            var visited: [Point: Set<Direction>] = [player.position: [player.direction]]
            while true {
                let playerLookahead = player.lookahead
                if obstacles.contains(playerLookahead) {
                    player.turn()
                } else {
                    if isInBounds(point: playerLookahead) {
                        player.advance()
                        visited[player.position] = visited[player.position, default: []].union([player.direction])
                        path.append(player)
                    } else {
                        break
                    }
                }
            }

            return visited.count.string
        }

        func solve2(input: String) async throws -> String? {
            let map = input.lines().map { $0.map(String.init) }
            let xBounds = 0..<map[0].count
            let yBounds = 0..<map.count

            func isInBounds(point: Point) -> Bool {
                xBounds.contains(point.x)
                && yBounds.contains(point.y)
            }

            var player = Player(position: Point(x: 0, y: 0), direction: .up)
            var obstacles: Set<Point> = []

            outerLoop:
            for (y, line) in map.enumerated() {
                for (x, block) in line.enumerated() {
                    switch block {
                    case "^":
                        player.position = Point(x: x, y: y)
                    case "#":
                        obstacles.insert(Point(x: x, y: y))
                    default:
                        break
                    }
                }
            }

            var path: [Player] = [player]
            var visited: [Point: Set<Direction>] = [player.position: [player.direction]]
            while true {
                let playerLookahead = player.lookahead
                if obstacles.contains(playerLookahead) {
                    player.turn()
                } else {
                    if isInBounds(point: playerLookahead) {
                        player.advance()
                        visited[player.position] = visited[player.position, default: []].union([player.direction])
                        path.append(player)
                    } else {
                        break
                    }
                }
            }

            var possibleObstacles: Set<Point> = []
            for snapshot in path {
                let snapshotLookahead = snapshot.lookahead
                let runnerObstacles = obstacles.union([snapshotLookahead])

                var runner = snapshot
                while true {
                    let runnerLookahead = runner.lookahead
                    if runnerObstacles.contains(runnerLookahead) {
                        runner.turn()
                    } else {
                        if isInBounds(point: runnerLookahead) {
                            runner.advance()
                        } else {
                            break
                        }
                    }

                    if runner == snapshot {
                        possibleObstacles.insert(snapshotLookahead)
                        break
                    }
                }
            }

            return possibleObstacles.count.string
        }
    }
}
