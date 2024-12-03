final class Solution3: Solution {
    struct Rucksack {
        let firstCompartment: String
        let secondCompartment: String
        let content: String

        init(content: String) {
            self.content = content
            firstCompartment = String(content.prefix(content.count / 2))
            secondCompartment = String(content.suffix(content.count / 2))
        }

        func commonItemInCompartments() -> Character {
            Set(firstCompartment).intersection(secondCompartment).first!
        }
    }

    private static let priorities: [Character: Int] = {
        var dictionary: [Character: Int] = [:]
        (UInt32("a")...UInt32("z")).enumerated().forEach { dictionary[Character(Unicode.Scalar($1)!)] = $0 + 1 }
        (UInt32("A")...UInt32("Z")).enumerated().forEach { dictionary[Character(Unicode.Scalar($1)!)] = $0 + 27 }
        return dictionary
    }()

    func solveFirst(input: String) async throws -> String {
        let result = input.components(separatedBy: "\n")
            .map(Rucksack.init)
            .map { rucksack in
                let commonItem = rucksack.commonItemInCompartments()
                return Self.priorities[commonItem]!
            }
            .sum()
        return String(result)
    }

    func solveSecond(input: String) async throws -> String {
        let rucksacks = input.components(separatedBy: "\n")
            .map(Rucksack.init)

        var result = 0
        for index in stride(from: 0, through: rucksacks.count - 3, by: 3) {
            let commonItem = Set(rucksacks[index].content)
                .intersection(rucksacks[index + 1].content)
                .intersection(rucksacks[index + 2].content)
                .first!
            result += Self.priorities[commonItem]!
        }

        return String(result)
    }
}
