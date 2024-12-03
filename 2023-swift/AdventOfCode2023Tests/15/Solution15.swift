import Foundation

final class Solution15: Solution {
    func solve1(input: String) async throws -> String? {
        let strings = input.components(separatedBy: ",")

        var sum = 0
        for string in strings {
            var currentHash = 0
            for asciiValue in string.compactMap(\.asciiValue) {
                currentHash += Int(asciiValue)
                currentHash *= 17
                currentHash = currentHash % 256
            }
            sum += currentHash
        }

        return String(sum)
    }

    final class 🔑: Hashable {
        static func == (lhs: Solution15.🔑, rhs: Solution15.🔑) -> Bool {
            lhs.hashValue == rhs.hashValue
        }
        
        let payload: String

        init(payload: String) {
            self.payload = payload
        }

        var hashValue: Int {
            var currentHash = 0
            for asciiValue in payload.compactMap(\.asciiValue) {
                currentHash += Int(asciiValue)
                currentHash *= 17
                currentHash = currentHash % 256
            }
            return currentHash
        }
    }

    final class Box {
        typealias Content = (label: String, value: Int)

        var contents: [Content] = []

        init() {}

        func add(label: String, value: Int) {
            if let index = contents.firstIndex(where: { $0.label == label }) {
                contents[index] = (label: label, value: value)
            } else {
                contents.append((label: label, value: value))
            }
        }

        func remove(label: String) {
            contents.removeAll { $0.label == label }
        }
    }

    func solve2(input: String) async throws -> String? {
        let strings = input.components(separatedBy: ",")

        let removeRegex = /(?<label>\w+)-/
        let addRegex = /(?<label>\w+)=(?<value>\d)/

        var boxes: [🔑: Box] = [:]
        for string in strings {
            if let match = try removeRegex.wholeMatch(in: string) {
                let label = String(match.label)
                let key = 🔑(payload: label)
                boxes[key]?.remove(label: label)
            } else if let match = try addRegex.wholeMatch(in: string) {
                let label = String(match.label)
                let key = 🔑(payload: label)
                let value = Int(match.value)!
                if let box = boxes[key] {
                    box.add(label: label, value: value)
                } else {
                    let newBox = Box()
                    newBox.add(label: label, value: value)
                    boxes[key] = newBox
                }
            } else {
                fatalError()
            }
        }

        print(boxes.map { "\($0.key.hashValue): \($0.value.contents)" }.joined(separator: "\n"))
        let sum = boxes.map { key, value in
            value.contents.enumerated().reduce(0, { total, content in
                total + (key.hashValue + 1) * (content.offset + 1) * content.element.value
            })
        }.sum()
        return String(sum)
    }
}
