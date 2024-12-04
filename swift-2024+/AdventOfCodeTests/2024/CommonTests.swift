import Testing

@Suite("OmniRange")
struct OmniRangeTests {
    private let matrix = [
        [5, 4, 3, 4, 5],
        [4, 2, 2, 2, 4],
        [3, 2, 1, 2, 3],
        [4, 2, 2, 2, 4],
        [5, 4, 3, 4, 5],
    ]

    private let center = OmniRange.Point(x: 2, y: 2)

    @Test
    func testSingleLength() {
        #expect(matrix[OmniRange(origin: OmniRange.Point(x: 0, y: 0), length: 1, direction: .up)] == [5])
        #expect(matrix[OmniRange(origin: OmniRange.Point(x: 4, y: 4), length: 1, direction: .right)] == [5])
        #expect(matrix[OmniRange(origin: OmniRange.Point(x: 1, y: 1), length: 1, direction: .down)] == [2])
        #expect(matrix[OmniRange(origin: OmniRange.Point(x: 2, y: 4), length: 1, direction: .left)] == [3])
    }

    @Test
    func testOrthogonalDirections() {
        #expect(matrix[OmniRange(origin: center, length: 3, direction: .up)] == [1, 2, 3])
        #expect(matrix[OmniRange(origin: center, length: 3, direction: .right)] == [1, 2, 3])
        #expect(matrix[OmniRange(origin: center, length: 3, direction: .down)] == [1, 2, 3])
        #expect(matrix[OmniRange(origin: center, length: 3, direction: .left)] == [1, 2, 3])
    }

    @Test
    func testDiagonalDirections() {
        #expect(matrix[OmniRange(origin: center, length: 3, direction: .upRight)] == [1, 2, 5])
        #expect(matrix[OmniRange(origin: center, length: 3, direction: .downRight)] == [1, 2, 5])
        #expect(matrix[OmniRange(origin: center, length: 3, direction: .downLeft)] == [1, 2, 5])
        #expect(matrix[OmniRange(origin: center, length: 3, direction: .upLeft)] == [1, 2, 5])

        #expect(
            matrix[OmniRange(origin: OmniRange.Point(x: 3, y: 0), length: 4, direction: .downLeft)]
            == matrix[OmniRange(origin: OmniRange.Point(x: 0, y: 3), length: 4, direction: .upRight)]
        )

        #expect(
            matrix[OmniRange(origin: OmniRange.Point(x: 0, y: 0), length: 5, direction: .downRight)]
            == matrix[OmniRange(origin: OmniRange.Point(x: 4, y: 4), length: 5, direction: .upLeft)]
        )
    }

    @Test
    func testEdges() {
        #expect(matrix[OmniRange(origin: center, length: 10, direction: .up)] == [1, 2, 3])
        #expect(matrix[OmniRange(origin: center, length: 10, direction: .right)] == [1, 2, 3])
        #expect(matrix[OmniRange(origin: center, length: 10, direction: .down)] == [1, 2, 3])
        #expect(matrix[OmniRange(origin: center, length: 10, direction: .left)] == [1, 2, 3])

        #expect(matrix[OmniRange(origin: center, length: 10, direction: .upRight)] == [1, 2, 5])
        #expect(matrix[OmniRange(origin: center, length: 10, direction: .downRight)] == [1, 2, 5])
        #expect(matrix[OmniRange(origin: center, length: 10, direction: .downLeft)] == [1, 2, 5])
        #expect(matrix[OmniRange(origin: center, length: 10, direction: .upLeft)] == [1, 2, 5])
    }

    @Test
    func testExactLength() {
        #expect(matrix[OmniRange(origin: center, length: 2, direction: .up)] == [1, 2])
        #expect(matrix[OmniRange(origin: center, length: 2, direction: .right)] == [1, 2])
        #expect(matrix[OmniRange(origin: center, length: 2, direction: .down)] == [1, 2])
        #expect(matrix[OmniRange(origin: center, length: 2, direction: .left)] == [1, 2])

        #expect(matrix[OmniRange(origin: center, length: 2, direction: .upRight)] == [1, 2])
        #expect(matrix[OmniRange(origin: center, length: 2, direction: .downRight)] == [1, 2])
        #expect(matrix[OmniRange(origin: center, length: 2, direction: .downLeft)] == [1, 2])
        #expect(matrix[OmniRange(origin: center, length: 2, direction: .upLeft)] == [1, 2])
    }
}
