import Foundation

final class Solution6: Solution {
    struct Race {
        let time: Int
        let distance: Int
    }

    func solve1(input: String) async throws -> String? {
        let (time, distance) = input.lines().map { $0.components(separatedBy: ":")[1].trimmed }.tuple()
        let races = zip(
            time.components(separatedBy: .whitespaces).compactMap(Int.init),
            distance.components(separatedBy: .whitespaces).compactMap(Int.init)
        ).map { Race(time: $0, distance: $1) }

        var result = 1
        for race in races {
            var waysToWin = 0
            var time = 0
            while time < race.time {
                if time * (race.time - time) > race.distance {
                    waysToWin += 1
                }
                time += 1
            }
            result *= waysToWin
        }

        return String(result)
    }

    func solve2(input: String) async throws -> String? {
        let (raceTime, raceDistance) = input.lines().map { $0.components(separatedBy: ":")[1].trimmed }.tuple()
        let race = Race(
            time: Int(raceTime.filter { !$0.isWhitespace })!,
            distance: Int(raceDistance.filter { !$0.isWhitespace })!
        )

        var waysToWin = 0
        var time = 0
        while time < race.time {
            if time * (race.time - time) > race.distance {
                waysToWin += 1
            }
            time += 1
        }

        return String(waysToWin)
    }
}
