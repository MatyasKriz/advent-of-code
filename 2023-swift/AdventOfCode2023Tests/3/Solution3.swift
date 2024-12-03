import Foundation

final class Solution3: Solution {
    func solve1(input: String) async throws -> String? {
        let map: [[Character]] = input.lines().map { $0.unicodeScalars.map(Character.init) }

        let height = map.count
        let width = map.first!.count
        var sum = 0
        for rowIndex in 0..<height {
            var number = ""
            for columnIndex in 0..<width {
                let character = map[rowIndex][columnIndex]
                if character.isWholeNumber {
                    number.append(String(character))
                } else {
                    if !number.isEmpty {
                        var containsSymbol = [
                            map[safe: rowIndex - 1]?[safe: columnIndex - number.count - 1],
                            map[safe: rowIndex]?[safe: columnIndex - number.count - 1],
                            map[safe: rowIndex + 1]?[safe: columnIndex - number.count - 1],
                            map[safe: rowIndex - 1]?[safe: columnIndex],
                            map[safe: rowIndex]?[safe: columnIndex],
                            map[safe: rowIndex + 1]?[safe: columnIndex],
                        ].compactMap { $0.map { isSymbol($0) } }.reduce(false) { $0 || $1 }

                        if !containsSymbol {
                            for (index, _) in number.enumerated() {
                                containsSymbol = containsSymbol || [
                                    map[safe: rowIndex - 1]?[safe: columnIndex - number.count + index],
                                    map[safe: rowIndex + 1]?[safe: columnIndex - number.count + index],
                                ].compactMap { $0.map { isSymbol($0) } }.reduce(false) { $0 || $1 }
                            }
                        }
                        if containsSymbol {
                            sum += Int(number)!
                        }
                        number = ""
                    }
                }
            }
            if !number.isEmpty {
                var containsSymbol = [
                    map[safe: rowIndex - 1]?[safe: width - number.count - 1],
                    map[safe: rowIndex]?[safe: width - number.count - 1],
                    map[safe: rowIndex + 1]?[safe: width - number.count - 1],
                ].compactMap { $0.map { isSymbol($0) } }.reduce(false) { $0 || $1 }

                if !containsSymbol {
                    for (index, _) in number.enumerated() {
                        containsSymbol = containsSymbol || [
                            map[safe: rowIndex - 1]?[safe: width - number.count + index],
                            map[safe: rowIndex + 1]?[safe: width - number.count + index],
                        ].compactMap { $0.map { isSymbol($0) } }.reduce(false) { $0 || $1 }
                    }
                }
                if containsSymbol {
                    sum += Int(number)!
                }
                number = ""
            }
        }

        return String(sum)
    }

    private func isSymbol(_ character: Character) -> Bool {
        String(character) != "."
    }

    func solve2(input: String) async throws -> String? {
        let map: [[Character]] = input.lines().map { $0.unicodeScalars.map(Character.init) }

        func number(at coordinate: (x: Int, y: Int)) -> (number: Int, position: (x: ClosedRange<Int>, y: Int)) {
            let line = map[coordinate.y]
            var startIndex = coordinate.x
            while line[safe: startIndex - 1]?.isWholeNumber == true {
                startIndex -= 1
            }
            let number = String(line.dropFirst(startIndex).prefix { $0.isWholeNumber })
            return (number: Int(number)!, position: (x: startIndex...(startIndex + number.count - 1), y: coordinate.y))
        }

        let height = map.count
        let width = map.first!.count
        var sum = 0
        for rowIndex in 0..<height {
            for columnIndex in 0..<width {
                let character = map[rowIndex][columnIndex]
                if String(character) == "*" {
                    let numberCoordinates = [
                        (x: -1, y: -1),
                        (x: 0, y: -1),
                        (x: 1, y: -1),
                        (x: 1, y: 0),
                        (x: 1, y: 1),
                        (x: 0, y: 1),
                        (x: -1, y: 1),
                        (x: -1, y: 0),
                    ]
                    .compactMap { coordinateOffset in
                        if map[safe: rowIndex + coordinateOffset.y]?[safe: columnIndex + coordinateOffset.x]?.isWholeNumber == true {
                            return (x: columnIndex + coordinateOffset.x, y: rowIndex + coordinateOffset.y)
                        } else {
                            return nil
                        }
                    }
                    .map(number(at:))
//                    .uniqued(on: { $0.number })
                    .uniqued(on: { Hashabler(x: $0.position.x.lowerBound, y: $0.position.x.upperBound, z: $0.position.y) })
                    .map { $0 }
                    if numberCoordinates.count == 2 {
                        sum += numberCoordinates[0].number * numberCoordinates[1].number
                    }
                }
            }
        }

        return String(sum)
    }

    struct Hashabler: Hashable {
        let x, y, z: Int
    }
}
