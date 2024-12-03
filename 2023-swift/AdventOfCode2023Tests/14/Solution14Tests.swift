import Foundation

final class Solution14Tests: SolutionTests<Solution14> {
    override var exampleInput1: String {
        """
        O....#....
        O.OO#....#
        .....##...
        OO.#O....O
        .O.....O#.
        O.#..O.#.#
        ..O..#O..O
        .......O..
        #....###..
        #OO..#....
        """
    }
    override var exampleOutput1: String? { "136" }
    override var exampleOutput2: String? { "64" }

    override var output1: String? { "109638" }
    override var output2: String? { "" }
    override var input: String {
        """
        .#....#.O##O....OO#O..O##.O.O..#..O...OOO.#..................#...#O#.##.#.....###O...#OO...#...#....
        ......O........O....O##..O#..O.O#.....O.....O...#.O...O...#...#O......#O.O##....#OO...#...O....O....
        .##O.O...O......O.O............O.O.O.....O.#O.O#.#..#O.#..O..OO.....OO..#..#.O#...O..OO......#.#....
        .O.O.#...##.O.#.......#.#.......#O#..#O.....OOO.OO.........O.#.#.O......#...#...#....O..O....#..###.
        #..#..#..#.#.O....O.O.OO....#.O...O.O.#O....#.#.O....#O.#.O#.......#..O.##O....O..OO.###O....#...OOO
        ...............OO#...####.......O...O##...........#.##O....#O#O.##O##..O.O.....O.O..O#...O...#...O.#
        ..O..OO.O...##....O#...#..OO.OO#......O.#.#O#..##...O..#O...O..#......O....O.#..#..O.O#O#.#....#....
        ....##.#..#...O......O...O..#....#.#.O......##.##OOOO#........O#..OO#OO.O.......O..O...O.O....##.#..
        O..O.###...OO....#.#OOO..##.OO.#......OOO..#..O.O....#O.#..O#.O.....O..#...O..O#....#O.OOO..O.OO.#..
        .....#......O#OO...O.#..O.#.O.O..#O..O...O#O...O....O###..#.........O..OO#.O...O.O......O.O.......#.
        .......#....#....O......O....O.O#.#.......#.O..O..##.O..O..O...O..##.#...O...OO.##....#OOO#O.#####.O
        .O..O.....O#..O#....O.OOOOO...#...O.#O..#O..O........O.....#O..##..#........#.OO.O..O...O.OO..OO....
        ........O..OO.#..#.O...#.O.#O#.OOO...O#OO#..O.OOO.....#O.O.O.OO..........#.....O.O.....#O.O.....#O#.
        ......OOO#...O.#O#.O.O#.O.#..OOO#.#.......O.##.O.#O#...O#.O....#.O#....O.##..#.#....OO.O.OO..O.OO...
        .O.O.OO.#.#O...#...#.#...O.#.........O..#O.O........#.O...#...O.O.O#.....O#.O....O...#...O#...O.#...
        .O....O.....O.O....OOO..O#...O...#.O.....OOO..#.O.#.O.O....O.OO.O.#..#O..OOO...O.......O..#.#.....O.
        #O###..O#.....###......#...#.#...OO...O.#.....#..#O....O.O...O#....O.....#...#...............O......
        .O.OO#O..O.OO#.#O#..#.O.##.##O.....###....O.......O#.#..#.....##...O..#...#.O.O##..OO..O.OOOO...O..#
        ..#.#.#..OO...#.....O.......#.OO.#.O.#O.O###.###.O......O...OO..##.O#.O....O..O..O..#.O..O.O...O#.#.
        #O.O....O....O.O......#..O.O...O.O#.O....OO#.OO.O...#.....O#..O.O#..#.#..........O..O....OOO...O..O.
        .#O...........O#....O..#O.O.#...#....O..........###...#........#.O.#..O#.O...O.#.....###.....##...O#
        ..O.O..##.#O...O.#..O....O#....#...O.O...O.O........O.#.O..O....#.##...O.#OOO.#....O..............#O
        .#....O....OO.#.O....O#O#...OO##....#.#......#O.#..O..##.O..#.##.#.O..#...O...##O......#.O.#.##..O#.
        .O#..#.O.#...O.OO...#.........O.....#O..........#..O#......#.O##.#.....OO....##OO...O.#.O.OOO...O.O.
        O..#....O.....OO.#O.....#....O.........O....O.O.O..#....#..O........#.#.O#.##..#...O#O....#...O#.#O.
        .#...OO#..O...#.#O..#.O....#.#.#.....##....O..O...#.O.O........O.#.O...O.O............#.......#.O...
        ...#.O....O.....#...#..O.OO...#O.OO....O##.OO#...O............O.....O............#O.OO...O#...#....#
        ..#O#.O.OO....O....O.....#..O...O...O..O#....OOO..O.#O.#O.......O..#.OO...#O##O..##..O...##..#...O..
        .....O##...#O..O....#...#..#O......#.#..O#.#....O..O.#....OOO.O..O.O....##..#O..#..#....#O..........
        ...#............O.O#......#.O.O...OO.....OO.....O..O..O.#O.O.#..O.O.O.O....O..O...OO..O.OO...##...O.
        O.O......O...#....OO.#..#..#....##.#OO.....O.#OO.OO.O..#O.O#......##.#..O#.#O..O....#O....OO#...##OO
        .......O....#..OOO..#.#...O.....OO.OO.#..#...#O....O..O.....O..#...O......#....O.#.....O....#....#O.
        ..#OOO.....#.O..#....#OO.#O.....O.O...#...#O#.......#....O...##..O...O...O.O...O..#.....OO#.OO.O..O#
        #..#.#.O#.O..O..###..#.....O.O#...#.O...#.O#..#O.OO..O.#.#..O.#.#.#....##..OO##.....#.....#.O...#...
        #O.O.O...OO#....O....O##......#OO#.O.OO.OO#O..O..OOO.....O..#O.#..#O..O....#...OO....##OO#O...#.....
        #.#.....O..O..O.O#.O........O........##..O.......OO...O..#...O#.O.O.O.O#.O..O#.....OOO.O.#...#O.O..O
        O...OOOO.###.O.............#...O..........#.#........###OO.....#....O....#O...##..O...O#..O.O..#..#O
        ..O.#O.......O..OO.O...#....#O.#...#....O.O...O....OO.........O....OO.........OO#..#.##..OO.#.#..O..
        ......O.O.#O..O....OO#....O...#..O#....O###..OO.O........O.O##....##O.O.O......O.#....##O.#..O.#.O.#
        ....O....##.#...OO#.#....#....O.#.##....#..O..OO..OO....OO...OO.#O#......#O#...#O.....#.O#...OO.O...
        ..O####...........O.O.......OOOO...OO#.....#......O..O...O..OO..#..O...#O#..#.#O#O#...###..#O..#....
        .......O#..#.O.#.......#.O.#O.#..#OO#O....##..#...O..O##...#.OO.O.O.O.O....O.O...#.#.....OO...#.O...
        O.#.....#...O...#...#.OO.#O..O.#...O.O...O#O..##......#.#.....O...#......O##...OO......O.OO....#.#O#
        ##O#.O.......#.......#..O.O..O.##...O....#......O.#....O...O....O.OO.O.O......#OOO.O#O.##..#O.O..#.#
        O#...O.....#..O..#O..O#....##.#.O.....OOOO....O.#.................#O.O..OO.#OO.#.....#.#.#...#...O..
        O.OO.O....#..##...O.#O......O#..#..#...O....#O#.O.O......#..O.#O#...O...#O....O..#O#O.....#.#OO...O.
        .#.O###..O#O...#.....#..O....O.O#O...O.....O.##..O#.#...#..#O...#OOOO#...#.#O#....O....#O.#..#O.#O#.
        #....O.OO.O.......#....#..OO.O.....O..#.......OO....#......O##..O..O#..O....O..##..O..OO..#.O..#...#
        ##O#.#.O....O........OO........O#.#.#O......#...O#O...OO##.........#.##.##......#.O...O.OOO..#..O.O.
        ...........O.##.O#.O.#OO#O.#O...###...O.O.#...O...O.#....#.#....OO#.#......O..#..O.O.#.......O.#.#..
        .OO...O...........#.O....O..O..OO..O.....O.O...O#.OO....#OOOO....#.O.#.#.O#.O...#.O....O#...##O.....
        ...........O.#...#...O..#..O..#..O..O.O.........#O.OO..O.OO.....O.O........OO..O...O....O.O..#OOO...
        O#.O##.O.OOO.O#.##........O...OOO...#...OOO....O#.....#.OO..#..O#.....O#.O...O...#.OO.O#..##...OO#..
        ....#.O....O.O.O#.O#O...O.O.O.O..OO.O#...#.OO..O#...O.#...O..#...#..#.#O..OOO.O.OO.........#.O.O..O.
        ...O....OO....##...O..O.#O...O.#.#...OO...O....O.O#.#.O...#.O#O...O.....O....O.#O...O...............
        ..#..O.#..O.#....O.O.O...O#...O....O.OO..#.OO#....O..O.O..O....OO...OO........#....OO..O......O.#...
        .#.O#.#OO##...O..O..#...##..OO....OO...O..O..#......O.O..O#...#....OO.#O.##......#...........O#O....
        .#...#OO.O..#..#.O.OO#.#...#.##...O...#O....#..#O.#.#.OO.#..O..O.#...O#OOO..O...#.O.O....#...O..OO..
        .###O.O.#O#.O....O#.#...O....#...O....OO##.#.#...O.......O.#O.....#...#O...O..O........#O..O..OO...O
        O#.O...OO....#.##OOO.....O..OO........#.O..O..OOOOO#O..#O.#.#.....OO.O#.#..OO...O.O.OOO#O.#..#....O.
        ...#.#O..#..O.O..#.....#OO.O.OO####...##...O..O..###.O.#.#.O......O.O.#..#..##....OO#.##.O.O.O.OOOO#
        ...O#.....OOOO...O.##.O....#.#O.O#.###..#..#O..O.OO......#..#...O#.....OO.O##.O.O....#.#O.......O...
        #...#....#.....#O....#.....OO.#..OO.##..#O..O.O.....O.O.OO.O#O..#....O....###...O........#OOO...O...
        .O...O#O.#..#O..#OO.O...OO##O.#O.#.#..#....##O..O...#.OOO..#..#.........#O.#...OO......O.#..........
        .#.OO#..O.#.O.....#...#....##O#.....###O.O....##...#...O.......OO#......#....#.OO.#OOO#.#....#O.O.OO
        ...#.O.O.O#...#....#....#...O#..#.O#...OO#...O##O..##.#O...#.OO..###.O...O##O..O..O.OO...O..###.#...
        #O...O...#...#..#..O.O.O..#O...O.O#....O#..O................O....O..O......#.....##.#O..OO..O#..OO..
        #..O.#.###.#.#...#..O....OO..###O...O.OO..........#..O.O..O..O.......OO#O....OO..O.O.##.#O#...OO...#
        ...O..O.#O..#OO...###OO.O....##O....O...O...........#O##.O.#..O.O.#..OOOO.#..O..O#.O........#.#OOO..
        ...O##OOO.....O.#.....O.#....#O.O...O#.#..O....#.OO..O#...OO.#.O.OOO.#..O#...O.......O#O.O#O...O....
        .#....O...O#..........O...O.O.....O..#O..#OO.#...............##....O#O#....OO.###O....#.........###.
        ...OO.OO.#.......OO#.#..O..O....OO.##O...O.#.#..O##.O.O....OO.O..O.#..O..OO.#..O##.#..##.#...##..OO.
        .......O........#...O.##..#..O#O...O..O.#.#O..#..O......OO..O.#....O...O......OOO....O.#.#....#O..#.
        #..#....O..OO.#...#.O...O##.O#.O##..OOO.....OO..O#..#....O......OO...O.O......#.O..#..O....#....O...
        ...#.OO##.....OO...O......#.#..#..O#..O...O.O.O.........#..#.........O##..#.O..#..#....#..O......#..
        O.#...OO..#..O.#.#OO#....##.OO#...O....#.#..#....#..OO..#O..O...O#..O..##..O#....O..O#...##...O....O
        #.#.#.O.#O....O..#..#..O..OO.OO.#O.#..O..O....O.............#.O#...O#..#O.....O......#.......#...O..
        ....O.....##...O.#O.##.#.##OO..#....##O#.OO#.#..#..O##.#.#.#O.OO.#...O#..O.........O.##...##....#..#
        .O#.....###....#.OO#..O#....#.....O.O#O#..#O.....#....#...O...O..##.#.O...OO#.##..O.O...#..........#
        .OO..##......#O......#.O.O..O.##O.....O....#...O#.O..........O..#.O..#.......O....O.#...O.O.#.OO.O..
        ..#...O...#..#O.......O#..O..O#.#O.#O.#O#.#....O.#..O.O..#.#.O#...#.#.....#..OO.....O.#....O#.#..#..
        .O.##.O..OO........#.#..O..O.......OO.O.OO.....O.#.###O...#OO.....#O.......O.O.O...O..O.............
        OOO...OO.......O......O#O..#.#.O..OO#.#OO.....#....#OO.#...#.....OO.O..O#...#O.....O....O.#O#.......
        ..O.....O....O.O...#..O...O#....O.O.#.....#...O#.....O.....O#.O.##...O.O............O....O##.#O..O.O
        ....O..##O..O..O....#.....#.O.#.......#O...##.O#...OO.......O....#OO.O..O.O...O#..#......O...O..#..O
        ...#.O.....#.#.O...O#.....#.O..OO.O....O..#.O#.O#.O..#....#.........O..OO.O.O.O....O..#.OO...O##..#O
        .#....#..........O.##..OO#...O...#...O..#.O#..O...#...#O#.O.......#.#..O#O#..#O..O#....#.....OO.O...
        ..O.O..O.##...O..#.OO#..O.O.....O..OO#.OO.O...O....O#...##OO..#O....##.#OO#......#.OOO.....#O..O..#O
        .#....O##..O..#.O.#....OO#O..O..#..O.O.....#O..O##...O.....O....#.#.O###.O#...O.#..#.O......O.....O.
        O.......O.#...#....O...#....#.....O..#.#O..O#....##O.O#........OO.#......O..OO....O##O.O#.O....O..O#
        .#O.##.#O...O#...##.O....#O.#O#.#O.O.O#OO..O.#...O....#.....OO.#.......#..O.#..OO..O..OO.....O.....O
        .O#..#OO.O...O#O.O..#..O.##.....##...O.#O.O....OO.#.OO#OO.OO......#.#..#.......O..O..OO#...#.....#.#
        O#O.##....#.OO.O......#..O..O.OOO..#.....O.O.OO#.OO....#.O#O....OO.....O.O....#..#.O#.....O...O.....
        O.O.#....O..#O#O#O...##...OO#O....O..OO..........#...O##.#....O.O...##O.#O#.O#O.O.#OO.#..OO..O......
        ...OO####O#..##..#O.O...O..O..OO...#..O..O......O...O#O..O......#OO#.OO..O.#...#.#...#....O........#
        .....O.O...O.O#......#.#....#..O..O...OO..O.#.#..###....#.##......#....OOO.......O.O....#.#O..OO...#
        ....OO....OO...#....O.#O..........O..#..O.#O#.....#.#......#O....#..#........#O.#.....#.O..OOO#O.#O#
        O...O...#..O....O#...#..#.O...#..#..OO.##..##O...O#..#..##.##.OO..O..#O...OO..........O..#.#O##...O.
        #O.#...#......#OO..O.#...O.#.....O.....##.O....OO#..O..O...#.OO......O.....#OO.........#...#........
        ..##O.#..#.#.#O...OO......#O.#.O...O.#..#O..#.O....O....#.O#............####...OO.#..#O.O..#.O#.#O#.
        """
    }
}
