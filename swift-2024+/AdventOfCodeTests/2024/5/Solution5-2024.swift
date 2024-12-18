import Foundation

extension AoC_2024 {
    final class Solution5: Solution {
        func solve1(metadata: Metadata, input: String) async throws -> String? {
            let (ruleList, updateList) = input.components(separatedBy: "\n\n").tuple()

            let rules: [Int: Set<Int>] = ruleList.lines().reduce(into: [:]) { rules, rule in
                let (lhs, rhs) = rule.components(separatedBy: "|").map(\.int).tuple()
                rules[lhs] = rules[lhs, default: []].union([rhs])
            }

            let updates: [[Int]] = updateList.lines().map { $0.components(separatedBy: ",").map(\.int) }

            var counter = 0

            updateLoop:
            for update in updates {
                let updateSet = Set(update)
                var seenSet: Set<Int> = []

                // Reversing the page because our rules specify which pages should come after, not before.
                for page in update.reversed() {
                    if let dependencies = rules[page], !dependencies.intersection(updateSet).isSubset(of: seenSet) {
                        continue updateLoop
                    }

                    seenSet.insert(page)
                }

                counter += update[(update.count - 1) / 2]
            }

            return counter.string
        }

        func solve2(metadata: Metadata, input: String) async throws -> String? {
            let (ruleList, updateList) = input.components(separatedBy: "\n\n").tuple()

            let rules: [Int: Set<Int>] = ruleList.lines().reduce(into: [:]) { rules, rule in
                let (lhs, rhs) = rule.components(separatedBy: "|").map(\.int).tuple()
                rules[lhs] = rules[lhs, default: []].union([rhs])
            }

            let updates: [[Int]] = updateList.lines().map { $0.components(separatedBy: ",").map(\.int) }

            var counter = 0

            updateLoop:
            for update in updates {
                let updateSet = Set(update)
                var seenSet: Set<Int> = []

                var wasEverIncorrect = false

                // Reversing the page because our rules specify which pages should come after, not before.
                for page in update.reversed() {
                    if let dependencies = rules[page], !dependencies.intersection(updateSet).isSubset(of: seenSet) {
                        wasEverIncorrect = true
                    }

                    seenSet.insert(page)
                }

                if !wasEverIncorrect {
                    continue updateLoop
                }

                var fixedUpdate = update

                // Bubble sort using the rules we have.
                bubbleLoop:
                while true {
                    var wasIncorrect = false
                    seenSet = []
                    for index in fixedUpdate.indices.reversed() {
                        let page = fixedUpdate[index]
                        let isCorrect = rules[page]?.intersection(updateSet).isSubset(of: seenSet) ?? true

                        if !isCorrect {
                            wasEverIncorrect = true
                            wasIncorrect = true
                            if index != 0 {
                                fixedUpdate.swapAt(index, index - 1)
                            }
                        }

                        seenSet.insert(page)
                    }

                    if !wasIncorrect {
                        break
                    }
                }

                if wasEverIncorrect {
                    counter += fixedUpdate[(fixedUpdate.count - 1) / 2]
                }
            }

            return counter.string
        }
    }
}
