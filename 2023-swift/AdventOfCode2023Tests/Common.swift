import XCTest
import Algorithms

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

    final func testExampleFirst() async throws {
        guard let exampleOutput1, !exampleOutput1.isEmpty, let result = try await solution.solve1(input: exampleInput1) else { return }
        XCTAssertEqual(exampleOutput1, result)
    }

    final func testExampleSecond() async throws {
        guard let exampleOutput2, !exampleOutput2.isEmpty, let result = try await solution.solve2(input: exampleInput2) else { return }
        XCTAssertEqual(exampleOutput2, result)
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
        guard !skipTest1, let result = try await solution.solve1(input: input) else { return }
        if let output1, !output1.isEmpty {
            XCTAssertEqual(output1, result)
        } else {
            print("======= \(SolutionUnderTest.self) result first:", result)
        }
    }

    var skipTest2: Bool { false }
    final func test2() async throws {
        guard !skipTest2, let result = try await solution.solve2(input: input) else { return }
        if let output2, !output2.isEmpty {
            XCTAssertEqual(output2, result)
        } else {
            print("======= \(SolutionUnderTest.self) result second:", result)
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
        return trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }

    func takeUntil(occurence: String) -> String? {
        return components(separatedBy: occurence).first
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

extension Array {
    func tuple() -> (first: Element, second: Element) {
        (first: self[0], second: self[1])
    }
    
    func triple() -> (first: Element, second: Element, third: Element) {
        (first: self[0], second: self[1], third: self[2])
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
