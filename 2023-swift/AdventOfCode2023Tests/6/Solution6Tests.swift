import Foundation

final class Solution6Tests: SolutionTests<Solution6> {
    override var exampleInput1: String {
        """
        Time:      7  15   30
        Distance:  9  40  200
        """
    }
    override var exampleOutput1: String? { "288" }
    override var exampleOutput2: String? { "71503" }

    override var output1: String? { "2449062" }
    override var output2: String? { "33149631" }
    override var input: String {
        """
        Time:        52     94     75     94
        Distance:   426   1374   1279   1216
        """
    }
}
