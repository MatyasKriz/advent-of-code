import XCTest
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
