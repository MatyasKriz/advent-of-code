import XCTest
import Algorithms

class SolutionTests<SolutionUnderTest: Solution>: XCTestCase {
    final private var solution: Solution!
    
    var exampleInput: String { "" }
    var exampleSolutionFirst: String? { nil }
    var exampleSolutionSecond: String? { nil }
    
    var outputFirst: String? { nil }
    var outputSecond: String? { nil }
    var input: String { "" }

    override func setUp() {
        solution = SolutionUnderTest()
    }

    final func testExampleFirst() async throws {
        guard let exampleSolutionFirst, !exampleSolutionFirst.isEmpty, let result = try? await solution.solveFirst(input: exampleInput) else { return }
        XCTAssertEqual(exampleSolutionFirst, result)
    }

    final func testExampleSecond() async throws {
        guard let exampleSolutionSecond, !exampleSolutionSecond.isEmpty, let result = try? await solution.solveSecond(input: exampleInput) else { return }
        XCTAssertEqual(exampleSolutionSecond, result)
    }

    final func testFirst() async throws {
        guard let result = try? await solution.solveFirst(input: input) else { return }
        if let outputFirst, !outputFirst.isEmpty {
            XCTAssertEqual(outputFirst, result)
        } else {
            print("======= \(SolutionUnderTest.self) result first:", result)
        }
    }

    final func testSecond() async throws {
        guard let result = try? await solution.solveSecond(input: input) else { return }
        if let outputSecond, !outputSecond.isEmpty {
            XCTAssertEqual(outputSecond, result)
        } else {
            print("======= \(SolutionUnderTest.self) result second:", result)
        }
    }
}

protocol Solution {
    init()
    func solveFirst(input: String) async throws -> String
    func solveSecond(input: String) async throws -> String
}

enum TO: Error {
    case DO
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
}

extension String {
    subscript(int: Int) -> Character {
        self[index(startIndex, offsetBy: int)]
    }

    subscript(safe int: Int) -> Character? {
        guard int < count else { return nil }
        return self[index(startIndex, offsetBy: int)]
    }
}
