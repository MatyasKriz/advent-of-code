import Foundation

final class Solution7: Solution {
    enum Card: Int, CaseIterable, Equatable, Comparable {
        static func < (lhs: Card, rhs: Card) -> Bool {
            lhs.rawValue > rhs.rawValue
        }

        case A, K, Q, T, _9, _8, _7, _6, _5, _4, _3, _2, J

        init(string: String) {
            switch string {
            case "A":
                self = .A
            case "K":
                self = .K
            case "Q":
                self = .Q
            case "J":
                self = .J
            case "T":
                self = .T
            case "9":
                self = ._9
            case "8":
                self = ._8
            case "7":
                self = ._7
            case "6":
                self = ._6
            case "5":
                self = ._5
            case "4":
                self = ._4
            case "3":
                self = ._3
            case "2":
                self = ._2
            default:
                fatalError()
            }
        }
    }

    struct Hand: Comparable {
        enum Kind: Equatable, Comparable {
            case highCard
            case onePair
            case twoPair
            case threeOfAKind
            case fullHouse
            case fourOfAKind
            case fiveOfAKind
        }

        let kind: Kind
        let cards: String

        static func < (lhs: Hand, rhs: Hand) -> Bool {
            if lhs.kind == rhs.kind {
                for (lhsCard, rhsCard) in zip(lhs.cards.map(String.init).map(Card.init(string:)), rhs.cards.map(String.init).map(Card.init(string:))) {
                    if lhsCard != rhsCard {
                        return lhsCard < rhsCard
                    }
                }
                fatalError("read rules?")
            } else {
                return lhs.kind < rhs.kind
            }
        }
    }

    func solve1(input: String) async throws -> String? {
        let games = input.lines().map { $0.components(separatedBy: " ").tuple() }

        var hands: [(hand: Hand, bid: Int)] = []
        for (hand, bid) in games {
            var cardCount: [String: Int] = [:]
            for card in hand.map(String.init) {
                cardCount[card] = cardCount[card, default: 0] + 1
            }
            let maxValue = cardCount.values.max()!
            let handKind: Hand.Kind
            switch maxValue {
            case 5:
                handKind = .fiveOfAKind
            case 4:
                handKind = .fourOfAKind
            case 3:
                if cardCount.contains(where: { $0.value == 2 }) {
                    handKind = .fullHouse
                } else {
                    handKind = .threeOfAKind
                }
            case 2:
                if cardCount.filter({ $0.value == 2 }).count == 2 {
                    handKind = .twoPair
                } else {
                    handKind = .onePair
                }
            case 1:
                handKind = .highCard
            default:
                fatalError()
            }
            hands.append((hand: Hand(kind: handKind, cards: hand), bid: Int(bid)!))
        }

        return String(hands.sorted { $0.hand < $1.hand }.enumerated().map { ($0.offset + 1) * $0.element.bid }.sum())
    }

    func solve2(input: String) async throws -> String? {
        let games = input.lines().map { $0.components(separatedBy: " ").tuple() }

        var hands: [(hand: Hand, bid: Int)] = []
        for (hand, bid) in games {
            var cardCount: [String: Int] = [:]
            for card in hand.map(String.init) {
                cardCount[card] = cardCount[card, default: 0] + 1
            }
            let (maxKey, maxValue) = cardCount.max { $0.value < $1.value }!
            let handKind: Hand.Kind
            switch maxValue {
            case 5:
                handKind = .fiveOfAKind
            case 4:
                if let jokerCount = cardCount["J"] {
                    handKind = .fiveOfAKind
                } else {
                    handKind = .fourOfAKind
                }
            case 3:
                if let jokerCount = cardCount["J"] {
                    switch jokerCount {
                    case 1:
                        handKind = .fourOfAKind
                    case 2:
                        handKind = .fiveOfAKind
                    case 3:
                        if cardCount.contains(where: { $0.value == 2 }) {
                            handKind = .fiveOfAKind
                        } else {
                            handKind = .fourOfAKind
                        }
                    default:
                        fatalError()
                    }
                } else if cardCount.contains(where: { $0.value == 2 }) {
                    handKind = .fullHouse
                } else {
                    handKind = .threeOfAKind
                }
            case 2:
                if let jokerCount = cardCount["J"] {
                    switch jokerCount {
                    case 1:
                        if cardCount.contains(where: { $0.key != maxKey && $0.value == 2 }) {
                            handKind = .fullHouse
                        } else {
                            handKind = .threeOfAKind
                        }
                    case 2:
                        if cardCount.contains(where: { $0.key != "J" && $0.value == 2 }) {
                            handKind = .fourOfAKind
                        } else {
                            handKind = .threeOfAKind
                        }
                    default:
                        fatalError()
                    }
                } else if cardCount.filter({ $0.value == 2 }).count == 2 {
                    handKind = .twoPair
                } else {
                    handKind = .onePair
                }
            case 1:
                if let jokerCount = cardCount["J"] {
                    handKind = .onePair
                } else {
                    handKind = .highCard
                }
            default:
                fatalError()
            }
            hands.append((hand: Hand(kind: handKind, cards: hand), bid: Int(bid)!))
        }

        return String(hands.sorted { $0.hand < $1.hand }.enumerated().map { ($0.offset + 1) * $0.element.bid }.sum())
    }
}
