final class Solution2: Solution {
    enum Tool: CaseIterable {
        case 🪨
        case 📜
        case 🔪

        var value: Int {
            switch self {
            case .🪨:
                1
            case .📜:
                2
            case .🔪:
                3
            }
        }

        init(opponent value: String) {
            switch value {
            case "A":
                self = .🪨
            case "B":
                self = .📜
            case "C":
                self = .🔪
            default:
                fatalError()
            }
        }

        init(me value: String) {
            switch value {
            case "X":
                self = .🪨
            case "Y":
                self = .📜
            case "Z":
                self = .🔪
            default:
                fatalError()
            }
        }

        func clash(with other: Tool) -> ClashResult {
            switch (self, other) {
            case (.🪨, .🪨), (.📜, .📜), (.🔪, .🔪):
                .draw
            case (.🪨, .🔪), (.📜, .🪨), (.🔪, .📜):
                .win
            case (.🔪, .🪨), (.🪨, .📜), (.📜, .🔪):
                .loss
            }
        }

        func tool(for result: ClashResult) -> Tool {
            Self.allCases.first { $0.clash(with: self) == result }!
        }

        enum ClashResult: Int {
            case win = 6
            case draw = 3
            case loss = 0

            init(string: String) {
                switch string {
                case "X":
                    self = .loss
                case "Y":
                    self = .draw
                case "Z":
                    self = .win
                default:
                    fatalError()
                }
            }
        }
    }

    func solveFirst(input: String) async throws -> String {
        let rounds = input.components(separatedBy: "\n")
        let score = rounds
            .map { round in
                let tools = round.components(separatedBy: " ")
                let opponent = Tool(opponent: tools[0])
                let me = Tool(me: tools[1])
                return me.clash(with: opponent).rawValue + me.value
            }
            .sum()
        return String(score)
    }

    func solveSecond(input: String) async throws -> String {
        let rounds = input.components(separatedBy: "\n")
        let score = rounds
            .map { round in
                let info = round.components(separatedBy: " ")
                let opponent = Tool(opponent: info[0])
                let me = opponent.tool(for: Tool.ClashResult(string: info[1]))
                return me.clash(with: opponent).rawValue + me.value
            }
            .sum()
        return String(score)
    }
}
