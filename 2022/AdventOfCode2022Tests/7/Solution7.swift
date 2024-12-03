import Foundation

final class Solution7: Solution {
//    final class Reference {
//        let name: String
//
//        init(name: String, kind: Kind)
//
//        enum Kind {
//            case directory(children: [Reference])
//            case file(size: Int)
//        }
//    }

    final class Reference {
        enum Kind {
            case directory(children: [Reference])
            case file(size: Int)
        }

        weak var parent: Reference?
        var kind: Kind
        let name: String

        init(name: String, kind: Kind, parent: Reference?) {
            self.name = name
            self.kind = kind
            self.parent = parent
        }

        private var cachedTotalSize: Int?
        func totalSize() -> Int {
            if let cachedTotalSize {
                return cachedTotalSize
            }

            let totalSize: Int
            switch kind {
            case .directory(let children):
                totalSize = children.map { $0.totalSize() }.reduce(0, +)
            case .file(let size):
                totalSize = size
            }
            cachedTotalSize = totalSize
            return totalSize
        }
    }

    func solveFirst(input: String) async throws -> String {
        let root = constructFilesystem(from: input)

        return String(recursiveSizesUnder100k(reference: root))
    }

    func solveSecond(input: String) async throws -> String {
        let storageSize = 70000000
        let updateSize = 30000000

        let root = constructFilesystem(from: input)
        let requiredSpace = updateSize - (storageSize - root.totalSize())

        return String(recursiveSizeOverAndMin(required: requiredSpace, bestReference: root, currentReference: root)!.totalSize())
    }

    private func constructFilesystem(from input: String) -> Reference {
        let root = Reference(name: "/", kind: .directory(children: []), parent: nil)

        let listRegex = /\$ ls/
        let changeDirectoryRegex = /\$ cd (?<name>.+)/
        let dirRegex = /dir (?<name>.+)/
        let fileRegex = /(?<size>\d+) (?<name>.+)/

        let instructions = input.components(separatedBy: "\n")
        var currentReference: Reference?
        var instructionIndex = 0
        while instructionIndex < instructions.count {
            let instruction = instructions[instructionIndex]
            if try! listRegex.wholeMatch(in: instruction) != nil {
                instructionIndex += 1
                var children: [Reference] = []
                while instructionIndex < instructions.count && !instructions[instructionIndex].starts(with: "$") {
                    let content = instructions[instructionIndex]
                    let child: Reference
                    if let directory = try! dirRegex.wholeMatch(in: content) {
                        child = Reference(
                            name: String(directory.name),
                            kind: .directory(children: []),
                            parent: currentReference
                        )
                    } else if let file = try! fileRegex.wholeMatch(in: content) {
                        child = Reference(
                            name: String(file.name),
                            kind: .file(size: Int(file.size)!),
                            parent: currentReference
                        )
                    } else {
                        fatalError()
                    }
                    children.append(child)
                    instructionIndex += 1
                }
                currentReference?.kind = .directory(children: children)
            } else if let directory = try! changeDirectoryRegex.wholeMatch(in: instruction) {
                instructionIndex += 1
                switch directory.name {
                case "/":
                    currentReference = root
                case "..":
                    currentReference = currentReference?.parent
                default:
                    if case .directory(let children) = currentReference!.kind {
                        currentReference = children.first { $0.name == directory.name }
                    } else {
                        fatalError()
                    }
                }
            } else {
                fatalError()
            }
        }
        return root
    }

    private func recursiveSizesUnder100k(reference: Reference) -> Int {
        switch reference.kind {
        case .directory(let children):
            let totalSize = reference.totalSize()
            return (totalSize < 100000 ? totalSize : 0) + children.map { recursiveSizesUnder100k(reference: $0) }.sum()

        case .file:
            return 0
        }
    }

    private func recursiveSizeOverAndMin(required: Int, bestReference: Reference, currentReference: Reference) -> Reference? {
        switch currentReference.kind {
        case .directory(let children):
            let totalSize = currentReference.totalSize()
            let nextBestReference: Reference
            if totalSize > required && totalSize < bestReference.totalSize() {
                nextBestReference = currentReference
            } else {
                nextBestReference = bestReference
            }
            return children
                .compactMap { recursiveSizeOverAndMin(required: required, bestReference: nextBestReference, currentReference: $0) }
                .min { $0.totalSize() < $1.totalSize() }

        case .file:
            return bestReference
        }
    }
}
