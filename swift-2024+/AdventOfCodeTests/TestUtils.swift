import XCTest
import Foundation

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
        guard !skipTest1, (try? await evaluateExampleFirst()) != nil else { return }
        guard let result = try await solution.solve1(input: input) else { return }
        if let output1, !output1.isEmpty {
            XCTAssertEqual(output1, result)
        } else {
            print("======= \(SolutionUnderTest.self) first result:", result)
        }
    }

    var skipTest2: Bool { false }
    final func test2() async throws {
        guard !skipTest2, (try? await evaluateExampleSecond()) != nil else { return }
        guard let result = try await solution.solve2(input: input) else { return }
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
