import Foundation

extension AoC_2024 {
    final class Solution9: Solution {
        enum Component {
            case space(size: Int)
            case file(File)

            var isSpace: Bool {
                switch self {
                case .space:
                    return true
                case .file:
                    return false
                }
            }

            var isFile: Bool {
                !isSpace
            }

            var size: Int {
                switch self {
                case .space(let size):
                    return size
                case .file(let file):
                    return file.size
                }
            }

            var file: File? {
                switch self {
                case .space:
                    return nil
                case .file(let file):
                    return file
                }
            }

            var debugDescription: String {
                switch self {
                case .space(let size):
                    return "SPACE(\(size))"
                case .file(let file):
                    return "FILE(\(file.id), \(file.size))"
                }
            }

            struct File {
                let id: Int
                let size: Int

                func split(size: Int) -> (file: File, remaining: File?) {
                    if size >= self.size {
                        (file: self, remaining: nil)
                    } else {
                        (file: File(id: id, size: size), remaining: File(id: id, size: self.size - size))
                    }
                }
            }
        }

        func solve1(input: String) async throws -> String? {
            struct Disk: CustomDebugStringConvertible {
                var storage: [Component]

                mutating func popLastFile() -> Component.File? {
                    guard let (index, component) = storage.reversed().enumerated().first(where: { $0.element.isFile }) else { return nil }
                    storage.removeLast(index + 1)
                    return component.file
                }

                func nextSpace(after index: Int) -> (index: Int, size: Int)? {
                    guard let (index, space) = storage.enumerated().dropFirst(index).first(where: { $0.element.isSpace }) else { return nil }
                    return (index: index, size: space.size)
                }

                var debugDescription: String {
                    String(describing: storage.map(\.debugDescription))
                }
            }

            var id = 0
            let storage = input.enumerated().compactMap { index, character in
                if index % 2 == 0 {
                    let component = Component.file(Component.File(id: id, size: String(character).int))
                    id += 1
                    return component
                } else {
                    let spaceSize = String(character).int
                    if spaceSize == 0 {
                        return nil
                    } else {
                        return Component.space(size: String(character).int)
                    }
                }
            }

            var previousSpaceIndex = 0
            var disk = Disk(storage: storage)
            var currentFile: Component.File?
            repeat {
                guard let file = currentFile ?? disk.popLastFile() else { break }

                if let (spaceIndex, spaceSize) = disk.nextSpace(after: previousSpaceIndex) {
                    previousSpaceIndex = spaceIndex

                    let (splitFile, remainingFile) = file.split(size: spaceSize)
                    disk.storage[spaceIndex] = .file(splitFile)

                    if let remainingFile {
                        currentFile = remainingFile
                    } else {
                        currentFile = nil
                        let remainingSpaceSize = spaceSize - splitFile.size
                        if remainingSpaceSize > 0 {
                            disk.storage.insert(.space(size: remainingSpaceSize), at: spaceIndex + 1)
                        }
                    }
                } else {
                    if let lastFile = disk.storage.last?.file, lastFile.id == file.id {
                        disk.storage[disk.storage.endIndex - 1] = .file(Component.File(id: file.id, size: file.size + lastFile.size))
                    } else {
                        disk.storage.append(.file(file))
                    }
                    currentFile = nil
                    break
                }
            } while true

            var index = 0
            var result = 0
            for component in disk.storage {
                guard case .file(let file) = component else { continue }
                result += (index..<(index + file.size)).reduce(0) { $0 + $1 * file.id }
                index += file.size
            }
            return result.string
        }

        func solve2(input: String) async throws -> String? {
            struct Disk: CustomDebugStringConvertible {
                var storage: [Component]

                func space(fittingSize: Int) -> (index: Int, size: Int)? {
                    guard let (index, space) = storage.enumerated().first(where: { $0.element.isSpace && $0.element.size >= fittingSize }) else {
                        return nil
                    }
                    return (index: index, size: space.size)
                }

                var debugDescription: String {
                    String(describing: storage.map(\.debugDescription))
                }
            }

            var id = 0
            let storage = input.enumerated().compactMap { index, character in
                if index % 2 == 0 {
                    let component = Component.file(Component.File(id: id, size: String(character).int))
                    id += 1
                    return component
                } else {
                    let spaceSize = String(character).int
                    if spaceSize == 0 {
                        return nil
                    } else {
                        return Component.space(size: String(character).int)
                    }
                }
            }

            var disk = Disk(storage: storage)
            var fileId = disk.storage.compactMap { $0.file }.max { $0.id < $1.id }!.id
            while let (fileIndex, file) = disk.storage
                .enumerated()
                .compactMap({ index, element in
                    element.file.map { (offset: index, element: $0) }
                })
                .first(where: { $0.element.id == fileId }) {
                if let (spaceIndex, spaceSize) = disk.space(fittingSize: file.size), spaceIndex < fileIndex {
//                    print("file", file.id, fileIndex, file.size)
//                    print("space", spaceIndex, spaceSize)

                    disk.storage.remove(at: fileIndex)
                    disk.storage[spaceIndex] = .file(file)

                    let previousComponent = disk.storage[safe: fileIndex - 1]
                    let nextComponent = disk.storage[safe: fileIndex]
                    switch (previousComponent, nextComponent) {
                    case (.some(.space(let lhsSize)), .some(.space(let rhsSize))):
                        disk.storage.remove(at: fileIndex)
                        disk.storage[fileIndex - 1] = .space(size: lhsSize + file.size + rhsSize)
                    case (nil, .some(.space(let rhsSize))), (.some, .some(.space(let rhsSize))):
                        disk.storage[fileIndex] = .space(size: file.size + rhsSize)
                    case (.some(.space(let lhsSize)), nil), (.some(.space(let lhsSize)), .some):
                        disk.storage[fileIndex - 1] = .space(size: lhsSize + file.size)
                    default:
                        disk.storage.insert(.space(size: file.size), at: fileIndex)
                    }

                    let remainingSpaceSize = spaceSize - file.size
                    if remainingSpaceSize > 0 {
                        disk.storage.insert(.space(size: remainingSpaceSize), at: spaceIndex + 1)
                    }
                }
                fileId -= 1
            }

            var index = 0
            var result = 0
            for component in disk.storage {
                defer { index += component.size }
                guard case .file(let file) = component else { continue }
                result += (index..<(index + file.size)).reduce(0) { $0 + $1 * file.id }
            }
            return result.string
        }
    }
}
