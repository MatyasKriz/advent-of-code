import Foundation

final class Solution10: Solution {
    typealias Coordinate = (x: Int, y: Int)

    enum Pipe: String, Equatable, CaseIterable {
        case start = "S"
        case vertical = "|"
        case horizontal = "-"
        case topRight = "L"
        case topLeft = "J"
        case bottomRight = "F"
        case bottomLeft = "7"

        static var connectsLeft: [Pipe] { [.horizontal, .topLeft, .bottomLeft] }
        static var connectsRight: [Pipe] { [.horizontal, .topRight, .bottomRight] }
        static var connectsTop: [Pipe] { [.vertical, .topRight, .topLeft] }
        static var connectsBottom: [Pipe] { [.vertical, .bottomRight, .bottomLeft] }

        init(directions: [Direction]) {
            precondition(directions.count == 2)
            let sorted = directions.sorted()
            switch (sorted[0], sorted[1]) {
            case (.top, .left):
                self = .topLeft
            case (.top, .right):
                self = .topRight
            case (.top, .bottom):
                self = .vertical
            case (.bottom, .right):
                self = .bottomRight
            case (.bottom, .left):
                self = .bottomLeft
            case (.left, .right):
                self = .horizontal
            default:
                fatalError()
            }
        }

        func connects(to pipe: Pipe, direction: Direction) -> Bool {
            switch direction {
            case .top:
                (Self.connectsTop.contains(self) || self == .start) && (Self.connectsBottom.contains(pipe) || pipe == .start)
            case .right:
                (Self.connectsRight.contains(self) || self == .start) && (Self.connectsLeft.contains(pipe) || pipe == .start)
            case .bottom:
                (Self.connectsBottom.contains(self) || self == .start) && (Self.connectsTop.contains(pipe) || pipe == .start)
            case .left:
                (Self.connectsLeft.contains(self) || self == .start) && (Self.connectsRight.contains(pipe) || pipe == .start)
            }
        }
        
        enum Direction: Comparable {
            case top
            case bottom
            case left
            case right
        }
    }

    func solve1(input: String) async throws -> String? {
        let lines = input.lines()

        var rowIndex = 0
        var columnIndex = 0
        var startLocation: Coordinate?
        while startLocation == nil {
            if columnIndex == lines[0].count {
                columnIndex = 0
                rowIndex += 1
            }
            if rowIndex == lines.count {
                fatalError("where is the start")
            }
            if String(lines[rowIndex][columnIndex]) == "S" {
                startLocation = (x: columnIndex, y: rowIndex)
            }
            columnIndex += 1
        }

        guard let startLocation else { fatalError() }

        var length = 0
        var current = startLocation
        var previous: Coordinate?
        while length == 0 || current != startLocation {
            let lhsPipe = Pipe(rawValue: String(lines[current.y][current.x]))!
            let pipeCoordinates = [
                (x: 0, y: -1, direction: Pipe.Direction.top),
                (x: 1, y: 0, direction: Pipe.Direction.right),
                (x: 0, y: 1, direction: Pipe.Direction.bottom),
                (x: -1, y: 0, direction: Pipe.Direction.left),
            ]
            .compactMap { coordinateOffset in
                let character = lines[safe: current.y + coordinateOffset.y]?[safe: current.x + coordinateOffset.x]
                if let character, let rhsPipe = Pipe(rawValue: String(character)), lhsPipe.connects(to: rhsPipe, direction: coordinateOffset.direction) {
                    return (x: current.x + coordinateOffset.x, y: current.y + coordinateOffset.y)
                } else {
                    return nil
                }
            }

            let next = pipeCoordinates.first { pipeCoordinate in previous.map { $0 != pipeCoordinate } ?? true }!
            previous = current
            current = next

            length += 1
        }

        return String(length / 2)
    }

    struct Point: Hashable {
        let x: Int, y: Int
    }

    func solve2(input: String) async throws -> String? {
        var lines = input.lines()

        var rowIndex = 0
        var columnIndex = 0
        var startLocation: Point?
        while startLocation == nil {
            if columnIndex == lines[0].count {
                columnIndex = 0
                rowIndex += 1
            }
            if rowIndex == lines.count {
                fatalError("where is the start")
            }
            if String(lines[rowIndex][columnIndex]) == "S" {
                startLocation = Point(x: columnIndex, y: rowIndex)
                let lhsPipe = Pipe.start
                let directions = [
                    (x: 0, y: -1, direction: Pipe.Direction.top),
                    (x: 1, y: 0, direction: Pipe.Direction.right),
                    (x: 0, y: 1, direction: Pipe.Direction.bottom),
                    (x: -1, y: 0, direction: Pipe.Direction.left),
                ]
                .compactMap { coordinateOffset in
                    let character = lines[safe: rowIndex + coordinateOffset.y]?[safe: columnIndex + coordinateOffset.x]
                    if let character, let rhsPipe = Pipe(rawValue: String(character)), lhsPipe.connects(to: rhsPipe, direction: coordinateOffset.direction) {
                        return coordinateOffset.direction
                    } else {
                        return nil
                    }
                }
                let newPipe = Pipe(directions: directions).rawValue
                lines[rowIndex] = lines[rowIndex].replacingOccurrences(of: "S", with: newPipe)
            }
            columnIndex += 1
        }

        guard let startLocation else { fatalError() }

        var path: Set<Point> = []
        var current = startLocation
        var previous: Point?
        repeat {
            let lhsPipe = Pipe(rawValue: String(lines[current.y][current.x]))!
            let next = [
                (x: 0, y: -1, direction: Pipe.Direction.top),
                (x: 1, y: 0, direction: Pipe.Direction.right),
                (x: 0, y: 1, direction: Pipe.Direction.bottom),
                (x: -1, y: 0, direction: Pipe.Direction.left),
            ]
            .compactMap { coordinateOffset in
                let character = lines[safe: current.y + coordinateOffset.y]?[safe: current.x + coordinateOffset.x]
                if let character, let rhsPipe = Pipe(rawValue: String(character)), lhsPipe.connects(to: rhsPipe, direction: coordinateOffset.direction) {
                    return Point(x: current.x + coordinateOffset.x, y: current.y + coordinateOffset.y)
                } else {
                    return nil
                }
            }
            .first { point in previous.map { $0 != point } ?? true }!

            previous = current
            current = next

            path.insert(next)
        } while current != startLocation

        var inside: Set<Point> = []
        var isInside = false
        for rowIndex in 0..<lines.count {
            for columnIndex in 0..<lines[0].count {
                let point = Point(x: columnIndex, y: rowIndex)
                switch Pipe(rawValue: String(lines[rowIndex][columnIndex])) {
                case .bottomRight, .bottomLeft, .vertical:
                    if path.contains(point) {
                        isInside.toggle()
                    } else if isInside {
                        inside.insert(point)
                    }
                default:
                    if isInside && !path.contains(point) {
                        inside.insert(point)
                    }
                }
            }
        }

        return String(inside.count)
    }
}
