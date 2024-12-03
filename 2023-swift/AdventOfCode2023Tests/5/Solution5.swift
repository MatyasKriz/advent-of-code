import Foundation

final class Solution5: Solution {
    struct Map {
        typealias Mapping = (source: ClosedRange<Int>, destination: ClosedRange<Int>)

        let seedToSoil: [Mapping]
        let soilToFertilizer: [Mapping]
        let fertilizerToWater: [Mapping]
        let waterToLight: [Mapping]
        let lightToTemperature: [Mapping]
        let temperatureToHumidity: [Mapping]
        let humidityToLocation: [Mapping]

        let maps: [KeyPath<Self, [Mapping]>] = [\.seedToSoil, \.soilToFertilizer, \.fertilizerToWater, \.waterToLight, \.lightToTemperature, \.temperatureToHumidity, \.humidityToLocation]
        let mapDescriptions = ["soil", "fertilizer", "water", "light", "temperature", "humidity", "location"]

        func location(for seed: Int) -> Int {
            print("Seed", seed, terminator: ", ")
            var current = seed
            for index in 0..<maps.count {
                for mapping in self[keyPath: maps[index]] {
                    if mapping.source.contains(current) {
                        current = mapping.destination.lowerBound + (current - mapping.source.lowerBound)
                        break
                    }
                }
                print(mapDescriptions[index], current, terminator: ", ")
            }
            print("")
            return current
        }

        func minLocation(for seedRange: ClosedRange<Int>) -> Int {
            var subranges = [seedRange]
            for index in 0..<maps.count {
                var mappedSubranges: [ClosedRange<Int>] = []
                for mapping in self[keyPath: maps[index]] {
                    for (index, subrange) in subranges.enumerated().reversed() {
                        if subrange.overlaps(mapping.source) {
                            let offset = mapping.destination.lowerBound - mapping.source.lowerBound
                            mappedSubranges.append(
                                (max(subrange.lowerBound, mapping.source.lowerBound) + offset)...(min(subrange.upperBound, mapping.source.upperBound) + offset)
                            )

                            var splitSubranges: [ClosedRange<Int>] = []
                            if subrange.lowerBound < mapping.source.lowerBound {
                                splitSubranges.append(subrange.lowerBound...(mapping.source.lowerBound - 1))
                            }
                            if subrange.upperBound > mapping.source.upperBound {
                                splitSubranges.append((mapping.source.upperBound + 1)...subrange.upperBound)
                            }
                            subranges.remove(at: index)
                            subranges.append(contentsOf: splitSubranges)
                        }
                    }
                }
                subranges.append(contentsOf: mappedSubranges)
            }
            return subranges.compactMap { $0.lowerBound }.reduce(Int.max, min)
        }

        struct Input: Hashable {
            let input: Int, keyPath: KeyPath<Map, [Mapping]>
        }
    }

    let seedsRegex = /seeds: (?<ids>.*)/

    func solve1(input: String) async throws -> String? {
        let sections = input.components(separatedBy: "\n\n")

        func mappings(from section: String) -> [Map.Mapping] {
            section
                .lines()
                .dropFirst()
                .map { line in
                    let numbers = line.components(separatedBy: " ").compactMap(Int.init)
                    let increase = numbers[2]
                    return (source: numbers[1]...(numbers[1] + increase - 1), destination: numbers[0]...(numbers[0] + increase - 1))
                }
        }

        let seeds = try seedsRegex.wholeMatch(in: sections[0])!.ids.components(separatedBy: " ").compactMap(Int.init)

        let map = Map(
            seedToSoil: mappings(from: sections[1]),
            soilToFertilizer: mappings(from: sections[2]),
            fertilizerToWater: mappings(from: sections[3]),
            waterToLight: mappings(from: sections[4]),
            lightToTemperature: mappings(from: sections[5]),
            temperatureToHumidity: mappings(from: sections[6]),
            humidityToLocation: mappings(from: sections[7])
        )

        return String(seeds.map { map.location(for: $0) }.min()!)
    }

    func solve2(input: String) async throws -> String? {
        let sections = input.components(separatedBy: "\n\n")

        func mappings(from section: String) -> [Map.Mapping] {
            section
                .lines()
                .dropFirst()
                .map { line in
                    let numbers = line.components(separatedBy: " ").compactMap(Int.init)
                    let increase = numbers[2]
                    return (source: numbers[1]...(numbers[1] + increase - 1), destination: numbers[0]...(numbers[0] + increase - 1))
                }
        }

        let seedRanges: [ClosedRange<Int>] = try seedsRegex.wholeMatch(in: sections[0])!.ids
            .components(separatedBy: " ")
            .compactMap(Int.init)
            .chunks(ofCount: 2)
            .map { chunk -> ClosedRange<Int> in
                guard chunk.count == 2 else {
                    fatalError()
                }
                let (start, length) = (chunk.first!, chunk.last!)
                return start...(start + length - 1)
            }

        let map = Map(
            seedToSoil: mappings(from: sections[1]),
            soilToFertilizer: mappings(from: sections[2]),
            fertilizerToWater: mappings(from: sections[3]),
            waterToLight: mappings(from: sections[4]),
            lightToTemperature: mappings(from: sections[5]),
            temperatureToHumidity: mappings(from: sections[6]),
            humidityToLocation: mappings(from: sections[7])
        )

//        let minLocation = await withTaskGroup(of: Int.self, returning: Int.self) { group in
//            for range in seedRanges {
//                group.addTask {
//                    map.minLocation(for: range)
//                }
//            }
//            return await group.reduce(Int.max, min)
//        }

        var minLocation = Int.max
        for range in seedRanges {
            minLocation = min(minLocation, map.minLocation(for: range))
        }

        return String(minLocation)
    }

    actor Synchronizer {
        var minLocation = Int.max
    }
}
