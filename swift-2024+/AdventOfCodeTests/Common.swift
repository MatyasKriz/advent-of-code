import XCTest
import Foundation
import Algorithms

struct TestError: Error {}

class SolutionTests<SolutionUnderTest: Solution>: XCTestCase {
    final private var solution: Solution!
    
    var exampleInput1: String { "" }
    var exampleInput2: String { exampleInput1 }
    var exampleOutput1: String? { nil }
    var exampleOutput2: String? { nil }

    var additionalTests: [AdditionalTest] { [] }

    var output1: String? { nil }
    var output2: String? { nil }
    var input: String { "" }

    override func setUp() {
        solution = SolutionUnderTest()
    }

    final func evaluateExampleFirst() async throws {
        guard let exampleOutput1, !exampleOutput1.isEmpty, let result = try await solution.solve1(input: exampleInput1) else { return }
        XCTAssertEqual(exampleOutput1, result)
        if exampleOutput1 != result {
            throw TestError()
        }
    }

    final func evaluateExampleSecond() async throws {
        guard let exampleOutput2, !exampleOutput2.isEmpty, let result = try await solution.solve2(input: exampleInput2) else { return }
        XCTAssertEqual(exampleOutput2, result)
        if exampleOutput2 != result {
            throw TestError()
        }
    }

    final func testAdditional() async throws {
        for additionalTest in additionalTests {
            try await setUp()
            if let expectedOutput1 = additionalTest.output1,
                let result = try await solution.solve1(input: additionalTest.input),
                !result.isEmpty {
                XCTAssertEqual(expectedOutput1, result)
            }
            if let expectedOutput2 = additionalTest.output2,
                let result = try await solution.solve2(input: additionalTest.input),
                !result.isEmpty {
                XCTAssertEqual(expectedOutput2, result)
            }
        }
    }

    var skipTest1: Bool { false }
    final func test1() async throws {
        guard (try? await evaluateExampleFirst()) != nil else { return }
        guard !skipTest1, let result = try await solution.solve1(input: input) else { return }
        if let output1, !output1.isEmpty {
            XCTAssertEqual(output1, result)
        } else {
            print("======= \(SolutionUnderTest.self) first result:", result)
        }
    }

    var skipTest2: Bool { false }
    final func test2() async throws {
        guard (try? await evaluateExampleSecond()) != nil else { return }
        guard !skipTest2, let result = try await solution.solve2(input: input) else { return }
        if let output2, !output2.isEmpty {
            XCTAssertEqual(output2, result)
        } else {
            print("======= \(SolutionUnderTest.self) second result:", result)
        }
    }
}

struct AdditionalTest {
    let input: String
    let output1: String?
    let output2: String?

    init(input: String, output1: String? = nil, output2: String? = nil) {
        self.input = input
        self.output1 = output1
        self.output2 = output2
    }
}

protocol Solution {
    init()
    func solve1(input: String) async throws -> String?
    func solve2(input: String) async throws -> String?
}

extension Collection where Element == Int {
    func sum() -> Int {
        reduce(0, +)
    }
}

extension String {
    var nilIfEmpty: String? {
        isEmpty ? nil : self
    }

    var trimmed: String {
        trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }

    var int: Int {
        Int(self)!
    }

    func takeUntil(occurence: String) -> String? {
        components(separatedBy: occurence).first
    }

    subscript(range: Range<Int>) -> String {
        let stringRange = index(startIndex, offsetBy: range.lowerBound)..<index(startIndex, offsetBy: range.upperBound)
        return String(self[stringRange])
    }

    subscript(safeRange range: Range<Int>) -> String? {
        guard let lowerIndex = index(startIndex, offsetBy: range.lowerBound, limitedBy: endIndex), let upperIndex = index(startIndex, offsetBy: range.upperBound, limitedBy: endIndex) else { return nil }
        return String(self[lowerIndex..<upperIndex])
    }
}

extension Substring {
    var string: String {
        String(self)
    }

    var int: Int {
        string.int
    }
}

extension String {
    subscript(int: Int) -> Character {
        self[index(startIndex, offsetBy: int)]
    }

    subscript(safe int: Int) -> Character? {
        guard int >= 0 && int < count else { return nil }
        return self[int]
    }

    func lines() -> [String] {
        components(separatedBy: "\n").filter { !$0.isEmpty }
    }
}

extension Array {
    subscript(safe int: Int) -> Element? {
        guard int >= 0 && int < count else { return nil }
        return self[int]
    }
}

typealias Tuple<Element> = (first: Element, second: Element)
typealias Triple<Element> = (first: Element, second: Element, third: Element)

extension Array {
    func tuple() -> Tuple<Element> {
        (first: self[0], second: self[1])
    }
    
    func triple() -> Triple<Element> {
        (first: self[0], second: self[1], third: self[2])
    }

    func pairs() -> AdjacentPairsSequence<Array> {
        adjacentPairs()
    }

    func triples() -> [Triple<Element>] {
        enumerated().adjacentPairs().compactMap { lhs, rhs in
            let (lhsIndex, lhsValue) = lhs
            let (rhsIndex, rhsValue) = rhs

            if rhsIndex == count - 1 {
                return nil
            } else {
                return (first: lhsValue, second: rhsValue, third: self[rhsIndex + 1])
            }
        }
    }
}

extension Optional where Wrapped == Bool {
    var orFalse: Bool { false }
    var orTrue: Bool { true }
}

extension Set {
    mutating func insert<Other: Collection>(contentsOf collection: Other) where Other.Element == Element {
        collection.forEach { insert($0) }
    }
}

extension Int {
    var string: String {
        String(self)
    }
}

extension Collection {
    subscript<R>(safe range: R) -> Self.SubSequence where R : RangeExpression, Self.Index == R.Bound {
        self[range.relative(to: self).clamped(to: startIndex..<endIndex)]
    }
}

extension Collection {
    func print(_ comment: String? = nil) -> Self {
        Swift.print("\(comment.map { "\($0): " } ?? "")\(String(describing: self))")
        return self
    }
}

struct OmniRange: Hashable {
    static func all(origin: Point, length: Int) -> [OmniRange] {
        orthogonal(origin: origin, length: length) + diagonal(origin: origin, length: length)
    }

    static func orthogonal(origin: Point, length: Int) -> [OmniRange] {
        [
            OmniRange(origin: origin, length: length, direction: .up),
            OmniRange(origin: origin, length: length, direction: .right),
            OmniRange(origin: origin, length: length, direction: .down),
            OmniRange(origin: origin, length: length, direction: .left),
        ]
    }

    static func diagonal(origin: Point, length: Int) -> [OmniRange] {
        [
            OmniRange(origin: origin, length: length, direction: .upRight),
            OmniRange(origin: origin, length: length, direction: .downRight),
            OmniRange(origin: origin, length: length, direction: .downLeft),
            OmniRange(origin: origin, length: length, direction: .upLeft),
        ]
    }

    struct Point: Hashable {
        let x, y: Int
    }
    enum Direction {
        case up
        case upRight
        case right
        case downRight
        case down
        case downLeft
        case left
        case upLeft
    }

    let origin: Point
    let length: Int
    let direction: Direction
}

extension Collection where Element: Collection, Self.Index == Int, Element.Index == Int {
    subscript(_ range: OmniRange) -> [Element.Element] {
        let width = self[0].count
        let height = self.count

        guard width > 0 && height > 0 else { return [] }

        let origin = range.origin
        let offset = Swift.min(range.length, Swift.max(width, height)) - 1

        guard offset > 0 else { return [self[origin.y][origin.x]] }

        let validXRange = 0...(width - 1)
        let validYRange = 0...(height - 1)

        switch range.direction {
        // Orthogonal (the easy ones)
        case .up:
            return Array(self[safe: (origin.y - offset)...origin.y].map { $0[origin.x] }.reversed())
        case .right:
            return Array(self[origin.y][safe: origin.x...(origin.x + offset)])
        case .down:
            return self[safe: origin.y...(origin.y + offset)].map { $0[origin.x] }
        case .left:
            return Array(self[origin.y][safe: (origin.x - offset)...origin.x].reversed())
        // Diagonal
        case .upRight:
            return zip(
                (origin.x...(origin.x + offset)).clamped(to: validXRange),
                ((origin.y - offset)...origin.y).clamped(to: validYRange).reversed()
            )
            .map { x, y in self[y][x] }
        case .downRight:
            return zip(
                (origin.x...(origin.x + offset)).clamped(to: validXRange),
                (origin.y...(origin.y + offset)).clamped(to: validYRange)
            )
            .map { x, y in self[y][x] }
        case .downLeft:
            return zip(
                ((origin.x - offset)...origin.x).clamped(to: validXRange).reversed(),
                (origin.y...(origin.y + offset)).clamped(to: validYRange)
            )
            .map { x, y in self[y][x] }
        case .upLeft:
            return zip(
                ((origin.x - offset)...origin.x).clamped(to: validXRange).reversed(),
                ((origin.y - offset)...origin.y).clamped(to: validYRange).reversed()
            )
            .map { x, y in self[y][x] }
        }
    }
}
