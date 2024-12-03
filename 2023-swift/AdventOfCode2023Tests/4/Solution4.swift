import Foundation

final class Solution4: Solution {
    func solve1(input: String) async throws -> String? {
        let games = input.lines().map { $0.components(separatedBy: "|").tuple() }
        var points = 0
        for game in games {
            let winningNumbers = Set(
                game.first
                    .drop { String($0) == ":" }
                    .dropFirst()
                    .components(separatedBy: " ")
                    .compactMap { $0.trimmed.nilIfEmpty.flatMap(Int.init) }
            )
            let winningNumberCount = game.second
                .components(separatedBy: " ")
                .compactMap { $0.trimmed.nilIfEmpty.flatMap(Int.init) }
                .filter { winningNumbers.contains($0) }
                .count
            if winningNumberCount > 0 {
                points += (pow(2, winningNumberCount - 1) as NSDecimalNumber).intValue
            }
        }
        return String(points)
    }

    func solve2(input: String) async throws -> String? {
        let games = input.lines().map { $0.components(separatedBy: "|").tuple() }
        var cards: [Card] = []
        for game in games {
            let winningNumbers = Set(
                game.first
                    .drop { String($0) == ":" }
                    .dropFirst()
                    .components(separatedBy: " ")
                    .compactMap { $0.trimmed.nilIfEmpty.flatMap(Int.init) }
            )
            let winningNumberCount = game.second
                .components(separatedBy: " ")
                .compactMap { $0.trimmed.nilIfEmpty.flatMap(Int.init) }
                .filter { winningNumbers.contains($0) }
                .count

            cards.append(Card(multiplier: winningNumberCount))
        }

        var cardsWithCount: [(card: Card, count: Int)] = cards.map { ($0, 1) }

        for index in cardsWithCount.indices {
            let (card, count) = cardsWithCount[index]
            var incrementIndex = index + 1
            var multiplierLeft = card.multiplier
            while multiplierLeft > 0 && incrementIndex < cardsWithCount.count {
                let current = cardsWithCount[incrementIndex]
                cardsWithCount[incrementIndex] = (card: current.card, current.count + count)
                incrementIndex += 1
                multiplierLeft -= 1
            }
        }

        return String(cardsWithCount.reduce(0, { $0 + $1.count }))
    }

    struct Card {
        let multiplier: Int
    }
}
