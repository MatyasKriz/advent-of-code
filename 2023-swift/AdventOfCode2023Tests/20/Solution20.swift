import Foundation

protocol Module {
    func outputs(for pulse: Bool, from input: Module) -> [(module: Module, pulse: Bool)]
}

final class Solution20: Solution {
    var pulseQueue: [(module: Module, pulse: Bool)] = []

//    final class Broadcaster: Module {
//        private let outputs: [Module]
//
//        init(outputs: [Module]) {
//            self.outputs = outputs
//        }
//
//        func outputs(for pulse: Bool, from input: Module) -> [(module: Module, pulse: Bool)] {
//            outputs.map { (module: $0, pulse: pulse) }
//        }
//    }
//
//    final class FlipFlop: Module {
//        private let outputs: [Module]
//
//        private var isOn = false
//
//        init(outputs: [Module]) {
//            self.outputs = outputs
//        }
//
//        func outputs(for pulse: Bool, from input: Module) -> [(module: Module, pulse: Bool)] {
//            guard !pulse else { return [] }
//            isOn.toggle()
//            return outputs.map { (module: $0, pulse: isOn) }
//        }
//    }
//
//    final class Conjunction: Module {
//        private let outputs: [Module]
//
//        init(outputs: [Module]) {
//            self.outputs = outputs.map { (module: $0, lastPulse: false) }
//        }
//
//        func outputs(for pulse: Bool, from input: Module) -> [Module] {
//            guard let index = outputs.firstIndex(where: { $0.module === input }) else { fatalError("wtf") }
//            outputs[index] = (module: outputs[index].module)
//
//            When a pulse is received, the conjunction module first updates its memory for that input. Then, if it remembers high pulses for all inputs, it sends a low pulse; otherwise, it sends a high pulse.
//            outputs
//        }
//    }

    func solve1(input: String) async throws -> String? {
        nil
    }

    func solve2(input: String) async throws -> String? {
        nil
    }
}
