import Foundation

final class Solution10Tests: SolutionTests<Solution10> {
    override var exampleInput1: String {
        """
        .....
        .S-7.
        .|.|.
        .L-J.
        .....
        """
    }
    override var exampleOutput1: String? { "4" }
    override var exampleOutput2: String? { "1" }

    override var additionalTests: [AdditionalTest] {
        [
            .init(
                input: """
                ..F7.
                .FJ|.
                SJ.L7
                |F--J
                LJ...
                """,
                output1: "8",
                output2: "1"
            ),
            .init(
                input: """
                ...........
                .S-------7.
                .|F-----7|.
                .||.....||.
                .||.....||.
                .|L-7.F-J|.
                .|..|.|..|.
                .L--J.L--J.
                ...........
                """,
                output2: "4"
            ),
            .init(
                input: """
                .F----7F7F7F7F-7....
                .|F--7||||||||FJ....
                .||.FJ||||||||L7....
                FJL7L7LJLJ||LJ.L-7..
                L--J.L7...LJS7F-7L7.
                ....F-J..F7FJ|L7L7L7
                ....L7.F7||L7|.L7L7|
                .....|FJLJ|FJ|F7|.LJ
                ....FJL-7.||.||||...
                ....L---J.LJ.LJLJ...
                """,
                output2: "8"
            ),
        ]
    }

    override var output1: String? { "6923" }
    override var output2: String? { "" }
    override var input: String {
        """
        F-FJ--L7.FFJ..F--7FLF77FL7-77|7FF7--L-|.|FJJ7.L-L|7F-F.F7FF7-FF7L---7.|7|-F--|7FF7J7FJ7F7--L7FF---LL7F-7777.F7.L-|7FJF|7.F7FFF-77FJ.|F77F-77
        F7LLJJJLLJ|JFL7JLLF.|FFJ|LL7F-7LJL7.|.|F-J7F-77.||-LJLJ.L7F-7|LJF777.FL7F-|7-J7--JLJ|LJJ..L|.JJFJ.FL-7FLFF-F-7-L|LFJ.FJFFFJ-LL-77L--FL|L||.|
        F77||-F7-F-7-.L|.-7--J|F-FJL7F|.7LJ-F--|J---JL|--|.L--7|F|JLFJF-FJL-7-|-JFL|F|F7.|.|L-.FF--LLJF-J.L.L7-J|LF|-|-FJF---|LLJJF--J7L--7-7-|--|F|
        |-JJF7JL.JFL7|.F-7|7.-JF7.-JL7L||L|7J.L.|7L|L|L-7.FJ|LJFJJF7|FJJL7J-|-L7.||LJJ.F7JF-LJL-|J7.|7|..-J7LJJLL--F.-7L-.J.FL7FJFJ.7L|7|-J||L7.FL7|
        J77LF7JJL--JJ||JFFLJ7LFJ7|J7.F-F|.||LF.FF7||-|-F-L7|F7|L--FJ|7J-7J.LL7|7-|77|-F-F7||--7FF-FJ7--7.|.|7JFJ.||L77F|-|---7.F|F|7L77F7..||LLLF--J
        L|F77J|F-7..LFL7J-F.|.L-7J--LL--JJ77.F7F||F7|F7-.|F7777-7-LLJ|7.|-77L7J-.FJ|--7|.-J|.|FF77|J|L|F.F7-|||J|.|||LJJ-L7|LL7F-J-.J.LF|J-F---J|-|J
        ||JJL7--J|-F-7JJ.|JFF-|-JJFL.L.L7|F77LF7||||FJ||7F||-FFF--77LJF---J7.LJFFL-|LJL-J--7F|7||-L-J-F|7.|LF---F-L|7LLF-J---FJJF-7-JJ7|LJJ.|LLLLF-J
        LJL7.-7L7|FJLJLJ.|F||.L7FFL-7|-FF7|L-7|LJLJ|L7L-7|||F7L|F-J7-L|77|L7-7|FF.LJJLJ7|JLJ-F-J|.LFJ.JJ-FL-L|J-L-J|J7L|7J||.L|||-F7|F7-77FF-J-F|L|-
        JJL|FL7.|L7-|7J.F-F-LF-FF7-F77F7||L-7|L-7F-J.|F-J-||||7||F-77J.|-7.JF-7.|-F7.LL7..|JLL-7|7J|--.LF-J7L-7FLF7L7L-LF7|77FFLJ.|L-|J7|F|JL7.-JJ.|
        |.77FJ|FFJ|LL--7.LJ7-F-FJL7||FJLJL77||F7||F77||FF7|LJ|F||L7|77FL7|.|F7|F|LL|7..L7FJ7-LL||LF77JF77JLLFJ77-J77L|7..LJ77FJFFLJF7.F|77L--LJ.J.-7
        |7L-7F|-JFJ7J-L|.|.|-LLL7FJ|||F---JFJ||||||L7|L-J||F-JF|L7||F77-LJF-F7-FJF-LJF|LJFJ7F-.|L-J|F7F7J7F7||||.LJ-JJL.7-|-F7.|7-L|JJ.-JLFJFJ77FJ.F
        F--7FJ|.FLFF-F-JF-|J-LLL||FJLJL-7F7L7||||LJFJ|F--J||JF7L7||LJ|F7J-FJ.|-F77F77F7-F|J.|--L7F-J||||JLFF7LLJ7-7L7.|---LLJJFJ---L7JF|L-7-||F-F.FF
        F-JL7J-F-JL|7F7J7LF77J.FJ|L---7FJ||FJ||LJF7L-JL--7||FJL7|LJF-J|L7F777JF||LJJF||-F-7F77LFJ|-FJ||L7JL|L7J.|LJFJFJLL-F7|JFJJ7FLF-FF-7|7-LJL|--L
        JJL|LJFJ-7-|FF-77L|L-7FJFJF--7|L7||L7LJF7|L------J||L7FJ|F-J|JL7L7F-7LF|L7JJFJL7L7|||F7L7L7|FJ|FJ7FL7|LF7JF|.LJJ--F-7F|-|-L--JLJ-F7|-|FF|LFJ
        |J-FJ-7.LF7F7L7|.FL-7|L7L7L-7|L7LJL7|F7|LJF--7F-7FJ|FJL-JL--7-FJFJ|FJ-FJFJJ-L7FJFJ||||L7L7LJL7|L7FF-JL7-.FF--JF7-|LJ.7JL-.|7|FJ|-F-L..7F|-|7
        |7-|LJL7.|LJ|FJL-7FFJ|FJFJF7|L7L--7|LJ||F7L-7||FJL7LJF------J-L7L7|L-7L7L-77FJ|LL7|||L7|-|F--JL7L7L-7FJ.F-7J..L-.|-|7LJ.L|JF-JF|LJ7L77L-JLL-
        J7FLJ.F-7L-7||F--J-L7|L7L7|||FJJF7|L7FJLJL7FJ||L7FJF7L7F---7|JLL7LJF-JLL-7L7L7L7-|||L7|L-J|-F-7L7|F-JL-7L7L7F777|-J|7|7|.||L|L7|7F-|.77|J--7
        LJ7.|FL7L-7|LJL7.F77||JL7||LJL7FJ|L7||F---J|FJ|FJL-J|FJ|F--J7.FFL7FJF-7F7|FJLL7|FJ|L7||F-7L7L7|F||L7F-7|FJFJ||7-||--|LFJLJ---7|F-7LLFL7J.|F|
        7JF-|||L-7|L-7FJFJ|FJL--J|L7F7|L7|FJ||L7F7FJ|FJ|-F7FJL-J|..F7F-7FJ|FL7||LJL7F7|||FJFJ|||FJFJFJL7||FJL7LJL7L-JL7.FL7JF7L7||L7FJFLJJ|.7-|||-F|
        L-JLLLLJFJL7FJ|JL7|L7F--7L7LJ|L7|||FJ|FJ|LJFJL7|FJ|L7F-7L-7||L7|L7L7FJ|L-7FJ|||||L7|FJLJL7L-JF-J||L-7L-7F|F---J7|L|-|L77-L7L7|FL7F7.|FJ-F.FJ
        |F---7JFL-7|L7L7FJ|7LJF-JFJF7L7LJ||L7||7|F-JF-J|L7|7||-L--J|L7||FJFJL7|7FJ|FJLJLJFJ||F7F7L7F-JF7|L7FJF-JFJL-7F7F77|L|FJJ-||.LJ-L-JJ-J77-LJ|.
        -L.L7|JLF7|||L7|L7|-F7L-7L7||FJF7LJFJ|L-JL7|L-7L7||FJL7F7F7|FJ||L7L7FJL-JFJL----7|FJLJLJ|J|L--J|L7||FJ.FJF--J||||F7FJL7|FF7-|JJ.LJ7LJJFF|-F.
        .L7F-JLFJLJL--JL7||FJ|F7|FJ||L-JL7FJFJF7F7|F-7L7LJ|L7FJ|||LJL7|L7L7|L--7FJF---7||LJF----JFJF-7FJFJ||L7FL7|F7||||||SL-7L-7||.||FFL7L-|.F-F.-7
        -7LLL|7L7F-7F7F7LJ|L7|||||7||-F--JL-JFJLJLJ|FJ|L7FJFJL7|||F-7||FJ7||F--JL7L7F-JFJF7|F--7FJFJ|LJ-L7||FJF7|||L7|||||||FJF-J|L-7-J.L|L7JF|JLJ.|
        FL7-FF--J||LJLJL-7|FJLJLJL-JL7L--7F--JF7-FFJL7F-JL7|F-J|LJL7LJ||F-J|L---7|FJL-7L7|LJ|F-JL7L-7F--7||||J|||||FJ|LJLJL-JFJ-FJF-JJ|7.LFJ.FLJ-|77
        |JL7J|F-7|F------JLJF7F-----7|F7FJL---JL7FJF-JL-7FJ||F-JF--J7FJ||F-JF7F-JLJF--JFJL7||L7F7|F-J|F7LJ||L7|LJLJL-JF7F----JF-JFJF77J-|LJ-|JL7.-.|
        |.F|7LJFJ|L7F7F7F---JLJF----JLJLJF7F----JL7L-7F7||7||L-7L-7F7L7||L7-||L-7F-JF-7L-7L7L7LJ||L-7LJL-7||FJ|F------J|L-7F7||F-JFJL7J.|7.7J7J|7L-7
        |-F-|L|L-J|LJ||LJF7|F7JL--7F----7|LJ|F7F7-|F7||||L-JL7FJF-J||FJ|L7|FJ|F7|L7FJFJF7L7|FJF7LJF-JF-7FJLJ|J||F7F--7|L--J|L7|L7FJF-JJF77.|L|.L7-7J
        |.J||.-J|LLF7LJF-J|FJL----JL7F--J|JF-JLJL7LJ||||L---7||FJF7|LJFJFJ|L7||||FJL7|FJ|FJ|L7||F7L-7L7|L--7L7|||||F7|F7.F7L7|L7LJFJF-7LF77LFL|-77..
        |7||J.|-JFL|L-7L-7|L---7F-7FJL--7L7|F----JF-JLJL7F-7|LJL7||L-7L7L7L7|LJ|||F7||L7|L7L7LJLJ|F-JFJ|F--JFJ|||LJ|LJ||FJL7|L7|F-JJ|FJ7|L7.-7||.|.|
        F-7|.F7FLFLL-7L--JL----J|FJ|F---JFJ||JF7F7L--7F-J|FJ|F--J||F7L7L7L7|L-7|||||||FJL7|FJF7LFJL--JFJL--7|-|||F-JF7||L7FJ|FJ||FF7||F7L7|77J-77-FJ
        7.FJFF-J.--J||F7F7F7F7F-JL7|L--7FJL|L7|LJL7F7|L7FJ|FJL--7|||L7L7L7|L7FJLJ|||||L-7LJL7|L7L7F---JF7F-JL7|||L--JLJ|FJL7|L7|L-JLJLJL-JL-7LLJJF-L
        LJJJ.LJ--|7-FLJLJ||||||F--J|F-7||F7|FJL-7FJ|||FJ|FJL7F--J||L7L7L7|L7||F7FJ|||L7FJF--JL7|FJL7F77||L7F-J|LJF---7FJL7FJ|FJ|F--7F-7F----J7-|F|F|
        FJ---.|||LJF-JF--J|||LJL---JL7LJLJLJ|F7FJL7||||FJL7FJ|F-7|L7L7|FJ|FJ|LJ||FJ||FJL7L7F7FJ|L-7||L7||FJL-7|F-JF7-LJF7||FJL7||F7LJ|LJF---7J.-L.-J
        |.LJ|L7-|JJFJLL--7|LJF-------JF7F7F7|||L7FJ||||L-7|L7|L7||FJF||L7||FJF7|||FJ||F7|FJ||L7|F7|||FJ||L7F-J||F-JL7|FJ||||F-J||||F---7|F--J7.LL-|J
        LL.LFLLJL7FJ|F---J|F-JF7F----7|LJLJ||||FJL7||||F7|L7||FJ||L7FJ|FJ|||FJLJ||L7|||||L7|L7|||||||L7||FJ|F7|||F--JFJFJ||||F-JLJLJF--J||F7F77-|L|7
        F|FF7JLF|F7J-L--7FJ|F-JLJF---J|F---JLJ||F-J|||LJ|L7|||L7||FJL7||FLJ|L--7||FJ||||L7LJJ||LJ||LJFJ||L7||LJLJL--7L7|FJLJLJF----7|F7FJLJLJL7.|-|7
        JF|7J|-7|-FJJ.F-JL7||F---JF-7FJL7F--7-LJL-7||L-7L7|LJ|FJLJL7FJ|L7F-JF--J||L7|LJ|FJF--JL-7||F-JFJ|FJLJF------JFJ||F-7F7|LF-7|||LJF-7F--J-L.|.
        L7|J.--||.LJJ7L---JLJL7F-7|FJL7FJ|F-JF--7FJ|L-7|-|L7J||F77FJ|LL7||F7L--7||FJ|F-J|FJF7F7FJLJ|F7|FJL-7FJF-----7L7LJL7||||FJFJLJ|F-J|LJFL7.L|J|
        LLL.|JLFF7L7FF---7F-7JLJFJ|L--JL-JL--JF-JL7L-7LJFJFJFJLJL7L7|F-J|LJ|F7FJ||L7|L--JL7|LJ|||F-J|||L7F7||FJF----J-|F--JLJLJ|FJF7FJL----7-L|-LJ|.
        J.FF7J.LL---JL--7|L7L-7.L-JF7F7F------JF7.L7FJF7L7L7|F7F7|LLJL-7|F-J|LJF|L7|L7F---J|F-JL7L7FJ||.LJLJLJ.L--7F-7|L---7F--JL7|||F7F7F-JF7J.|FFJ
        .L7L-JLJLL-|FF--J|FJF7L7F-7||||L----7F-JL7FJL-JL7|FJ||LJ|L7F---J|L-7L-7FJFJ|FJL7F7FJL7F-J.LJF|L7F-7F-7F---J|FJ|F---JL-7F-J||||LJLJF7F7F77JJ.
        F-L-7FL.FJF77L--7|L-J|FJL7LJ|||F----J|F7FJL-7F7FJLJFJL-7|FJ|F---JF-JF7|L-J|LJF7||||F-JL-----7L7|L7|L7|L----JL-JL-7F7F7|L7FJLJL7|F-JLJLJ|7|F7
        |||-J-JLF7|L7F7FJL7F7|L7JL-7|||L-7F--J|||7F7LJ|L-7LL7F-J|L7LJF---JF7|LJF----7|LJ||||F7F7F7F-J.||7||FJL------7F--7LJLJLJFJ|F--7L7|F-----J||-|
        FF7-J-F||||FJ||L-7LJ||FJF7FJLJL7|LJF--JLJFJL7FJF7|F-JL7FJFJF-JF7F7||L--JF---J|F7||||||||||L--7||FJLJF-7F---7|L-7|F--7F7L-JL-7L-J|L-7F--7JJ-J
        L-7.LLF-JLJL-J|LFJF7LJL-J|L--7FJF7FJF7F7FJF-JL-J|||F7FJL7L7|F-JLJ||L-7F7L---7LJ||||||||LJ|F--JLJL7F7|FJ|F--J|F7||L-7LJ|F-7F-JF--JF-J|F-JJ|.|
        7L|-F-L7F7F--7L7L-JL----7|F--JL-J|L-JLJLJFJF7F-7|||||L7FL7|LJ|F7.|L7FJ|L7F--JF-J|LJLJ|L-7||F-7F--J|LJL-JL--7LJLJ|F7L-7||FJL--JF--JF7|L-7F|F7
        JJL-L7.LJ||F-JFJF7F7F--7||L-7F--7|F-7F7F7L-JLJFJLJ||L-JF7LJLF-JL-JFJ|FJFJ|F-7L-7L7F--JF7||LJFJ|F--J|F7F----JF7LFJ|L7FJ||L7F--7L--7|LJF7L---7
        |.L77LFF7LJ|F7L-JLJLJF7LJL-7LJF7||L7LJLJL7F--7L--7LJF-7||LF7L7F-7FJFJL7L7LJFJF-JFJL-7FJ||L7FJJLJF7F7||L--7F-JL7L7L7|L7||FJL7FL7F7LJF-JL----J
        F77LFJF||7LLJL------7|L---7|F7||||-L----7LJF7L--7L--JFJ|L7|L-J|FJ|-L7FJJL7FJ-L7FJF--JL7LJ|LJF7FFJLJLJL--7LJF--J7|FJL-JLJL7FJF7LJL-7L7F7||.L|
        LLJ-FF7||7FF7FF--7F7LJF--7|LJLJLJL----7FJF-JL-7-|F---J7L7LJF7FJL7L7FJ|.F7|L--7|L7L--7FJF7F7FJL-JF7F7F7F7L--JF--7|L----7F-JL-JL---7L-J|L-77J|
        ..|.FJLJ|F-JL-JF7LJ|F7|F7LJF--7F7F-7F7LJJ|F--7L7|L--7F7FJF7|||F-JFJL7L-J||F7FJL-JF--JL-JLJ|L7F7FJLJLJLJL----JF-JL-----J|F7F-7F--7L---JF7|JF7
        -7F7L-7FJL-----JL-7LJLJ||F-JF-J||L7LJL7FFJL77|FJL-7FJ|LJFJ|||||F7|F7|F7FJ|||L7F--JF7F7F---JFJ|LJF---------7F7L--------7LJ||FJL-7|F-7F7|LJ-J|
        FF|L--JL-7F-------JF7F7||L7-L--JL-JF-7L-JF7L7|L-7|LJFJF7|.||LJ|||LJ||||L7||L7|L7F7||||L7|F7L-JF7L---7F---7LJL7F-7F---7L-7LJL7F-J|L7||LJ7|L-7
        |.L-----7|L7F-----7|LJLJL-JF-------J7|F7FJL-J|F7L--7L7|||FJL7FJ||F-J|||FJLJ.||FJ||||||FJFJL--7||F7F7LJF-7L7F-JL7|L--7L--JF-7|L-7|FJ|L-7JJ|J.
        LLLF---7||.LJFF7F7LJF-7F7F7L--7F----7|||L---7|||F--JF||LJL-7|L-J|L-7|||L--7FJ|L7||||||L7|F--7LJLJLJ|F7L7|FJL--7||F--JF---JFJL7FJ|L7L-7|7F-.J
        F|-L--7|||F7|FJLJL7LL7|||||F7FJ|F---J||L-7F-JLJ|L---7LJF-7JLJF--JF7|||L7F7|L7|FJ|||||L7|LJF7L-7F7F7LJL7||L-7F7LJ|L--7|F-7FJF7|L7L7L-7LJ7J.7J
        L-F---JLJ|||FJF-7FJF7|LJLJLJ|L-JL---7||F7LJF7F7L----JF7|FJF7FJF7FJ|||L7LJ|||||L7|LJ|L7||F-JL--J|||L--7LJL-7LJL7FJF-7LJL7LJF||L-J-L7FJ7LJ.-L-
        .LL7F7F-7LJ|L7|FJL-JLJF-7F-7L-------JLJ||JFJ||L7F7F--JLJL-J||FJ|L7||L7|LFJL7||FJL-7|FJLJL-7F-7FJ||F--JF--7L---JL-JFJF-7L7F7||F---7LJJ|-|F|F|
        |.L||LJ7L-7L7LJL----7FJFJ|JL--7F7F-7F7J|L7|FJ|FJ||L7F--7F7FJLJFJFJLJFJ|FJF7|LJL7F7|||F----JL7||FJ|L-7FJF-JF---7F-7L7|7L7LJLJLJF7FJJ|.F-7-F-F
        |FFLJFF7F7|FJ-F-----J|FJFJF7F7||LJ-LJL7L7LJL-JL-JL-JL-7LJ||F7|L7|J-LL7||FJLJJ.LLJ||LJL-----7|||L-JF7LJFJF-JF--J|FJFJL-7L7F7F--J|L7JF||LFJ|L|
        FLFF7FJLJLJ|F7L---7F7|L-JFJLJLJ|F7F---JJ|F-7F7F7F-7F-7L-7LJ|L7-LJJ7.|LJ|L7-|7L-LFJL7F------J|||F--JL--JFJF-JF7FJL7L---J.LJ|L--7L-J7-77||.J.F
        ||FJ|L7F7F7|||F7F7LJ|L7F-JF----J||L----7||F||LJ|L7|L7L7FJF7|FJ7-|-7-|JF|FJ.LJLFLL--JL---7F7FJ||L------7|FJF7|||F-JF-7F7F77L7F7L7|JJLL|-7JL-J
        |-L7L-J||||LJLJLJL--JFJL7FJF----JL----7LJL7|L-7L-JL-JFJL-JLJL77L-J..JFFLJF7JL-F-F-----7-LJLJ7||F-----7LJL7|||||L-7|FJ|LJL-7|||FJ777JF|7F..L|
        |FL|F-7|LJL-7F7F-7F7FJF-JL7L7F-7F----7|F7FJL--JF----7L--7F--7L7J..F|LF|777L77..FL7F7F7L7F7.F7LJL----7L---J|LJLJF-J|L7|F--7|||||F777.L|-|F--L
        FFLLJLLJLF--J||L7||LJFL7F-JFJ|FJ|F---JLJ|L-----JF7F7L7F7LJF7L-J.J77..||-7|J.F-7L-LJLJL7LJL-JL7|F7F7.L-----JF7F7L-7|FJ|L-7LJLJLJ|L-77.|.LL7|J
        L|J|JLLJLL-7FJ|FJ||F-7F|L-7L7||FJL-----7|F-7F-7FJLJL7LJL--JL---7JL-.FF|7J.77-.|.||.LF-JF7F--7|FJLJ|F7F--7F7|LJL-7LJL-JF-JF---7FJF-JF-77--J7|
        .|.L|7F7LF7LJFJ|FJ|L7L-JF-JFJ|LJF------J||LLJ.||JF7|L7F-7F7F-7FJ7.L-77LJ|.||FFJFL-F7L-7|LJF-JLJF-7|||L-7||LJF7F7L7F7F7L--JF7FJ|FJFFJFJ7..FL-
        .F-FJFLF7|L-7|FJL-JFL7F7L7JL-J|FJF---7F7LJF7F7LJFJL-7|L7||||-LJL77JFLJ7L----7JLL7.|L--JL7-L----JFJLJL--JLJF7|||L7||||L----JLJFJL7FJFJJL7.FJJ
        F|.7JF-|LJF7LJ|F7F7F7||L-JF7JF7L7|F--J||F-JLJL--JF7FJ|FJ|||L7|.L.F.-7J|FFF7L|JLLF7L-----JF---7F-JF7F---7F7|||LJFJLJLJF7F7|F7JL-7||FJ|F7LJ7|.
        LJ-F-|J|F7|L7FJ||||||LJJF7||FJL-J|L7F7||L7F7F7F7FJLJ-LJ.||L7|77.FLJ7|FJ7F---FJ|J||F7.F7F7L--7LJF7|LJF-7||LJLJF7L7F7F7||||FJL77FJLJL-7JJLL777
        .|.LF-.LJLJ|LJJ|LJ|||F--JLJLJF7F7|LLJLJL-J|LJLJ|L7F7F--7|L7LJ-F777L77--FL---J.|.|LJL-JLJ|7F7L--JLJF7L7|LJF7F7||FJ|LJ||LJLJF7L-JF7F--JL|-LL|7
        -77F7-|LLLF----JF7LJ|L7F7F-7FJLJLJF------7L7F7FL7LJLJF-JL-J-J.L---FJJ|LJ..|..F|FL7F7F--7|FJL------JL-JL--JLJLJLJJ|F-JL-7F-JL-7FJLJ7||7JJF..|
        .LLLJF-7|FL-7F7FJ|F7L-J||L7LJF7F7-L----7|L7LJL-7|F7F-JF7-|F77F7|||.|-7J|7.J-|7FF7||||F-JLJF7F7F7F--7F7F7F--7FF7F7|L--7FJL---7|L---7-|7FF77JJ
        F.F|LJF|-FF-J|||J||L7F-JL-JF-JLJL-----7L7L|F7F7|LJ|L--JL--7|FFJ-7J.F---7F|JF7-FJ|LJLJL7F-7|||||LJF7||||||F-JFJLJLJF--JL7F---JL7F--J-F7-LJ||7
        LL||JLLJ.FJF7|||FJ|FJ|F---7L7F-------7L7L7LJLJ|L-7|F7F-7F-J--7.LJ-7JLJFFJ7-L|JL7L77LF-J|FJ||||||FJLJ|LJLJ|F-JF7F7FJF7LFJL----7LJ7F-7||J|-L-|
        .JJ|J||F.L-J||||L-JL7|L7F7L7LJF7|F---JJ|FJF7F7L--JLJ|L7LJF7F|.F.F-|LF--L-|-||.FL7|7FJF7|L7|LJLJFJF-7|F---JL7FJ|||L-JL-JF-7F--JF-7|FJ|L--77FJ
        F.F77.LJ.|FFJ|||F7F-JL7LJ|FJF-JL-JF---7|L-JLJL-7.F77L-JF7|L77|77|LF--FJ|7J.F--F-J|F|FJLJLLJF--7L-JJ||L-----JL7||L7F7F7FJ7|L-7FJFJ|L-JF-7L7J.
        77..L7|---FL7|LJ||L---JFFJL7L-----JF--J|F------JFJ|F7F-JLJFJ7|.F7L||.||F7.F7|JL-7L-J|7F7-F7L7FJF7F-J|F-7F----J||F||||||LFJF-JL7|FJF-7L7|FJLF
        L7.-JFJ.FLF-J|F7||F7F7LFJF7L---7F--JF7FLJ7F----7L7||||F---J7--FJL-77FLJ.7FL77||LL---JFJL-J|FJL-J|L--JL7|L---7FJ|FJ|LJ|L7L7L---JLJFJLL-JLJ|FF
        |J7.F7.L77L--J|LJ||LJ|FJFJL---7|L---JL7F7FJF-7FJFJLJLJL--7F77LF7JLFF7J|F-J-F777-FF---JF7F7LJF-7FJF7.F-JL--7FJL7|L7L-7|FJ-L7F-7F-7L-----7JLJ|
        7.F7F|..|FJJF-JF7LJF7|L-JLF7F7|L-7F---J|LJFJ|LJFJF--7F---J|L7FJL7-FJL77LFJ|||F7.FL-7F-JLJ|F-JFJ|.||FJF-7F7LJF7LJFJF7||L-77|L7|L7L7F-7F-J7|.7
        7-LF7.FFL--FL--JL-7||L----JLJLJF7|L-7F7|F-JLF--JFJF7|||F7J|FJ|F-J7|F-JJ.|7-||||FF7LLJF7F7|L-7L7L-JLJFJFJ|L--JL-7|FJ|||F-JFJFJL7|FJL7|L7F-JF-
        LL.|.F-L|J.F-7F7F7LJL----7F-7F7||L--J|||L--7|F--JFJ|LJFJL7||J|L--7||F7F7F7FJ||L7|L7F7||||L--JJL7F---JFL-JF-----J|L7|||L77L7L-7||L7FJL-J77F7.
        .L|F7F||F-7L7||LJ|F-7-F7FJ|FJ|LJL--7FJLJF--J|L-7FJFJLFJF7||L7|F--J|||LJLJ|L7||FJL7||LJLJL--77F7LJLF7F7-F7L-7F7F7L-JLJL-JF7|F-JLJJ||77.LJL-|J
        77.-|FL-L7L7|LJF7|L7|FJLJFJL-JF7F7JLJF--JF--JF-J|FJF7|FJLJ|FJ|L7F7|||F--7|FJ|||F7||L7F-7F-7L-JL7F-JLJL-JL--J|LJL-----7F7||||F---7|L7F7J|LL-J
        LFJ.||JJ|L7LJF7||L-J|L---JF7JFJLJL--7L---JF--JF7|L-J||L7F7||7|FJ|LJ|||F7LJL7||||||L7LJ-LJ-L---7|L7F7F----7F-JF7F-7F-7LJ||LJLJF--JL-J7JL-7FL7
        L|.FFL7-7|L7FJLJL7F7L-7F-7||FJF7F7F7|F7F7FJF7F|LJF--J|FJ|LJL-JL7L-7||LJL7F7|||||||FJ|F--7.F7F7|L-J|LJF---J|F-J|L7LJ-L--JL-7F7L-7JJ|F77-L77JJ
        --LJ.L|7F7FLJF--7LJ|F7LJFJ||L-JLJLJ|LJ|||L-JL-JF-JF7L||L|F-----JF-J||F--J|||||LJLJL-7|F7|FJLJ|L---JF-JF---JL-7L-J-F7F--7F7LJ|F-J7.77FJF-JJ7|
        L7||7.LFJ|-F7L-7|F-J||F7L-JL-------JF7LJ|F7F--7L7FJ|FJ|FJL----7FJF7LJ|F7J|LJ||F7F--7|LJ|||F-7|F7FF7L--JF7F---JF---JLJF-J|L77LJF-7F-7LFJ7J.L7
        JJ.JLF|L7|F||LFJ|L--JLJL--------7F--JL-7|||L7|L-JL7||FJL7F----JL-JL-7LJL7L-7LJ|LJF7LJ|FJLJ|FJ|||FJL----JLJF--7|F-----JF7|FJF7-L7||FJL|.FJF|J
        J.J.77LFJL-JL-JFJF7-F7F7F------7LJJF7F-J|||FJF-7F7||||F7|L---7F7F---JF-7L7FJF7L7L|L7F7|F-7|L7|||L---------JF7||L7F7F7FJLJL-JL7FJLJL7.|7.--|7
        |-LL7-7L7F-7F-7L7||FJ|||L-----7|-F-JLJF7LJLJJ|FJ|||LJ||||F---J||L---7L7L7|L-J|FJFJFJ||LJ|LJFJ|||JF-7F------JLJ|FJ|||||F--7F-7LJF7F7|FJJF|7JL
        77.LL7||LJ7LJ|L7LJ|L7LJL---7F-JL7L----JL7F7-FJL7||L-7||LJL7F7F|L7F-7L7L7LJF7|||FJFJFJ||F7F7L7LJL7L7|L-------7FJL-JLJLJL-7LJJ|F7|LJLJJ------7
        LF-||F-7F7F-7F-JF7|JL---7F7|L--7L-------J|L7L7FJ|L7FJLJF--J||FJFJL7|-L7L7L||FJ|L7|7L7L7|||||L7F7L-JL--------J|F----7F7F7L--7|||L-7JFJ|JLJ|F-
        F|--FL7LJ||FJL-7|LJF7-F7LJ||LF7|F7F7-F7F7L7|FJL-JFJL--7L7F7||L7|FFJL-7L7L7|LJFJFJL7FJFJ||||F7||L---7F7F------JL-7F7LJLJL---JLJ|F-JJF-7.7|F||
        F|JLLFL-7LJL7F-JL7FJL-J|F7||FJ|LJLJL7|LJ|||||F-7FJF7F7L7LJLJL7|L7L7F-JFJFJL-7L7L7FJL7|FJLJLJ|LJF7F7LJLJF7F---7F7LJL---------7F|L7F-77|-LLF7L
        |.-7LF--JF-7LJF-7LJF7F7||||||FJFF-7FJL7FJFJLJL7||L||||F|F7F--JL7L-J|F7L7|7F7|FJFJL-7||L--7F-JF7|LJ|F7F7||L--7LJL-7F7F------7|FJFJ|FJJ|L|-LJJ
        7FFFFL7F7|JL-7||L-7|LJ|LJLJLJL-7L7||LFJL-JF---J||FJLJL-J|LJF7F7L-7FJ||FJL7|LJL-JF7FJ||F--JL7FJ|L-7LJLJ||L---J|F7FJ|LJF----7LJL-JF||F--7-F-.|
        LF-FJ|LJLJF--J|F--JL7FJF---7F-7L-J|L-JF7F-JF--7LJL-----7L7.|LJL7FJL-JLJF-JL-7F--JLJ.|||F--7|L7|F7|F7F7LJF--7F7||L-JF-JF---JF7F7F7|||F-J-L7F|
        |LF7.F---7L--7|L--7FJL-JF--J|FJF-7L-7FJLJF7|F-JF--7F7F7L7L7|F--J|F7F-7FJF-7FJL7-F7F7||LJF7|L-JLJ|||LJL--JF-J|||L--7|F-JJF7FJLJLJLJ||||7JLF7.
        JFLJFL--7|F--J|F-7LJ|F7FJF-7||FJJ|F7LJLF-J||L7LL-7LJLJL7|FJ||F-7LJLJFJL7L7|L-7|FJLJ||L7FJ|L---7FJLJF7F7F-JF7|||F--J||FF7|LJF-----7LJL--7J.FL
        FJJLF7.FJLJF7FJL7L7F-JLJFJFJ|LJFFJ|L7F7L-7||FJF7LL----7|||FJLJFJF77FJF7L7||JFJ|L7F-JL7|L7|F7F7||7|FJ||||F-JLJLJL---JL7|||F-JF7F-7L7F---J.FJ7
        L|.LF7FL---JLJF7L7|L---7|LL-JF-7|FJFJ|L7FJLJ|FJL7F7F7FJLJ|L-7FJL||FJFJL-J||FJFJ-|L7F7|L7|||||||L7FJFJ||||F--7F7F--7F-J|LJL--JLJFJL||F-7J7..|
        J.F.|7FF-7F7F7|L7||F-7JLJF7F7L7|LJFJ.|FJL--7||F-J||||L7F-JF7||F7||L7|F7F7||L7|F7|FJ|||FJ|||||||FJ|FJJ||LJL-7|||L-7|L--JF7F--7F7|.FJLJFJJ7F|J
        |F7-FF7L7|||||L7|||L7|F7FJLJL-JL--JF7||F7F-J||L7FJ|||FJ|F7|||||LJ|FJ||||||L7||||||FJ||L7|LJ||LJL7||F7|L7F--J||L7FJL7F--J|L-7LJLJ-L7F7L7LL-|.
        .||.||L-JLJ|||FJ||L-JLJ||F7F--7F--7|LJ|||L-7|L7|L7|||||LJLJ||||F-JL7||||LJFJ|LJ|||L7||F||7FJL--7||||||.|L-7J||FJ||FJL-7LL--JF7F7LLLJ|FJ7-J|F
        FL77-L----7LJ|L7LJF-7F7LJ|||F-J|F-JL-7||L7FJL7|L7||||L--7F-J|||L7F-J|||L-7L7|F-J|L7|||FJL7L-7F7|||LJ||FJF7|FJ|L7|FJF--JF----JLJ|F--7LJJL-7LJ
        -||F---7F7L-7L-JF7|JLJL7FJLJL7FJ|F7F7||L7|L-7|L7LJLJL7F-JL7FJ|||||F-J||F-JFJ||F7L7|||||F7|F-J||||L-7LJ|FJ||L7||||L7L--7L7F-----J|F-J..77F||7
        LLFL--7LJL--JF-7|LJF---J|F---J|FJ|||||L-J|F7|L7L-7|F-JL--7LJFJ|FJ||F-J||F7L7|LJL7|||LJLJ||L7FJ|||F7L7FJL7|L7|L7|L7L7F7L-JL----7FJL7.7F|7-7F|
        F|JLF-JF--7F7L7||F-JF7F7||F--7|L7|||||7F-J||L7|F7|FJF7F--JF7L7|L7|||F-JLJL7|L7F-J|||F---J|FJL7||LJ|FJL7FJ|FJ|FJ|FJF||L7F7F---7LJF7|-L-F-FJJJ
        -FFFL--JF-J|L7|||L--JLJ||LJF-J|FJ|||||FJF7|L7|||||L7||L---JL7|L7||LJL-7F-7||FJL-7|LJL7F7FJL-7||L7FJL7L||7LJFJ|7LJJFJ|FJ||L--7L7FJLJ7.F|J||F|
        |LJ7JLF-JF7L7||LJF--7F-JL7FJF7||FJ|||||FJ|L7||||LJFJ||F7F7F-J|FJLJF---JL7||||F--JL7F7|||L--7|||FJ|F7|FJL--7L7L-7F7|FJL7|L7F-J|||LLL..F|--7JJ
        J-LJLFJF-J|FJ||F-JF7LJF7FJ|FJ||||7||LJLJ7|FJ||LJF7L7||||||L7FJL--7L---7FJ|||||F--7|||LJL7F-J|||L7LJLJL7F--JJ|F7LJ|LJF7||FJ|FF7LJJ|LLLJJ7F77.
        |.|L-L7|FFJL7||L-7||F7|||FJ|FJ||L7LJF---7|||||F-JL-J||||||FJL-7F7L7.F-J||LJLJ||F-JLJ|F7FJL7FJ||FJF7JF-JL---7LJL-7L7F|LJ|L7L-JL-7-F.J.LFFL-|7
        7J|.|JLJ-L7FJLJ-FJ|LJ||LJ|FJL7|L7|F7L--7||L7||L7F--7|||||||F--J||FJFJF7L----7|||F7F7LJ|L7FJL7||L-JL7L7F7F-7L--7J|FJFJF7L7|F7F--JF77.FF|J.L-|
        |LF--7.LF-J||-|7L7|F-J|F-JL-7||FJLJ|F--JLJFJ|L7LJF-J|||||LJL7F7|LJFJFJL7F7F7||||||||F7|-|L-7||L7F7FJFJ||L7L---JFJ|L|FJ|FJ|||L---JL--7-|J.LLJ
        7-|7.FJ|L-7L77LF-J||F-J|F7F7|LJ|F7FJL-7F7FJ-|FJF-JF7||||L-7FLJ|L-7L7L-7LJ||||||LJ||LJ|L7|F7|||FJ||L7L7|L7L----7L7L7LJJLJFJ|L7F7F7F7FJF|.L7J|
        L7FJ7|.||-|FJF7L-7|||F-J|||LJF-J|LJJF7|||L7FJL7|F7|||||L7FJF--JF-J7|F-JF-J|LJ|L7F|L-7L-JLJLJ||L7|L-JFJL7|F----JFJFJJF---JFJL||||||LJFJJ-.||7
        LLJ-L--|77||FJL--J||||F-J||7FJF7L7|FJLJ|L-J|F-JLJLJ||LJF||FJF-7L7|FJL-7|F7|F-JFJFJF7L-7LF7JFJL7|L-7FJF7||L----7|FJ|.L---7L-7||||||-L|7|.F|FJ
        7|...F-LF-LJ|F-7F7|||LJ7FJL7L7|L7L7L7F7L--7|L-7FF--JL--7|||FJFJFJFJF7FJ|||||F-JLL7||F7L7|L7|F7||F7|L7||||F7F7FJ||.77|.LLL7FJLJ||||FLLFJ7F-J|
        LL.F7J.F77J-||LLJ||||LF-JF7|FJL7|FJ7||L7F-J|F7L7L7F7F--J||LJ|L7L7|FJ|L7||||||F7F7||||L7LJFJ|||||||L7||LJ||||LJ-LJ--7-|-|||L-7LLJ||7.LJ.F-|J|
        --LJJ|.|J-J.LJ7J|LJLJJL7FJ||L7FJ|L-7||FJL7FJ|L-JF|||L--7||F---JFJ||FJFJ||LJ|LJLJ|||||FJF7|JLJLJ||L7||L7|||||7FFL7|L|7|JF-JF-J-|J|L7F7J.7JL-7
        |7||LJ.L||FF-L77|.LLJ-J|||LJFLJ.|F7||||F-JL7L-7F7LJL7F-J||L7F-7|7LJL7|FJL-7|F--7|||||L7||L----7||FJ||FJFJ||L-7--F7FJF||L--JJ.LJ|L-JJLF7-7|FJ
        J-LL-L7L---J7|.J.F7.J7-||F------J|LJ||||F7FJF7LJ|F7FJL-7||FJ|FJL--7FJ|L7F7||L7.||LJ||FJ|L7F---JLJL7|LJ-L7|L--J|.LLJJLLJFFL-FL7L|J||.7J|.FF-L
        |7|L-.L7L7|J|77.|-F7-F-|||F-7F--7L7FJ||||LJFJ|F-J|LJF-7||||FJL7F-7|L7|FJ|||L7L7||F-J|L7|FJL----7F7LJJ|L7LJ7.|J|7L-7LJ|LL77FJ-J|L-J--|-J.LLJ|
        F--F-|LL-L||L7.F7FJ.|.|LJLJJ||JFJFJL-J|||F7|-|L-7|F7L7||LJ|L7FJ|FJL7||L7||L7|FJ||L7FJ|LJ|F7F---J||7LLJJ|LLJ-|.F7F-L--7.L77|J.FL-7F7.LF-7FFFJ
        |.F7F777L|L--JFL-JFL-J77.F|L|L7L7|F--7||LJ||FJF-JLJ|FJ||F-JFJ|FJL7FJLJJLJ|FJLJFJL7LJF---J||L----JL7.||||F.|-|-LJJF|J.|7|L.F77F-7LF.LJJF7|-JL
        .FJ|-|-7L7LL7JF-FL-7.LJJ-F7-L-JFJLJF-J||F-J|L7L--7FJL7||L-7L7LJF-JL--7F--JL-7FL-7|F-JF7F7||F--7F7FJ--|-7J.|7.|.|7FL.F|---FJ-L.FJ7|7|7FL7|..|
        7.||7LL|J|F|F7.F||-|.-J..||-FF-JF7FJLFJ|L7FJ7|F7FJ|F7|||F-JFJF7L-7F--J|F-7F7L-7FJ||F-J||LJ|L7FJ|LJFJL|-L.FJJF-.|FL|J7L|J7FJJ|-|FJL-|F-.LLF7.
        |FF|J--JLJLFL--J|L.J-JFF77|.FJF7||L77L7|LLJLFJ||||LJ||LJL7FJFJL--JL--7||FJ|L7FJ|FJLJ7FJL-7|FJL7L7F7-FF7L7.|.|-|JL-L.|JL7J7J.7-LL|..|J7FL7|J7
        |7L7J|-F.L7|.|7.|J-J7FJJ.|LFL7|LJL7|JLLJ7JF-JFJ|L7F-JL7JJ||F|F7F7F7F7|LJL7L7||FJL7F--JF7FJ|L-7L7LJL-7LJ-J-77J-L7JFL7JF7|LF--|F7.J.F||-|-LJ.7
        |JJJFJ.|7L|-L|77J.F.L|7LFJLFFLJ7JJLJJ7.LL-L7FJFJFJL7F7L7FLJ-LJ||||||LJ.|7|FJ||L--JL-7FJ||FJF-JLL7F-7|7L-L..||F|JL77L7LJ|.7|J|LJ7.F-FJFF7FFFF
        |JJ.|JFL-7|J.L---7.FLLF7L.FJ7FL7L7-LLF7..L-|L7|FJ77LJL7L7F|FL7LJ||||-J-LFJL7|L7F----J|7LJL7|7FLFJL7LJ-JJ..-FJ.|---J|FJJ.FLF.L7.|.L|LJ|L|7||7
        JFF-77JL|LL7777.||-7J|L|7.-FJ-|JFL-FLL777JLL-J||--7|||L-J-|7.LLFJ|LJ-FL.L7FJL-JL---7FJ7JJF|L-7-L--J-J.|FF.||FF|.|.L-|-7-F.LF-J-FFJ|7.FJL-7J.
        L|7JJFJFF7LJJL77FF7J7|LL7-LJJJ|.|7.JJLJ-J7.L|.||||LF|-.LJJ.L|..L-J||FJJFLLJJ..L7LJ7LJJ7.F-JF-J.JJL77|-FF|-7.L-L7|-FFL.|..|F-7J-JJ7LF7L7FLF7.
        FJ7.F|FF-|.LF7F7-|J|-|FFL--|.F.|7LLJ.|LFL7-F|-LJ-L7.|.L-J-F7.-|.L.L-J7-77FLF|-|L.FJ7|7JFL-7L7|7|LL|L77J|JJFJ.L|7|-LFL7L77LJ.7.--|LJL7|F7J.L7
        .|||7JLF---F|FJJLJ7FF-|-.L-LJ---J.|F-7.7.|.F7.||F7LF|7|..-7|.LFJJF|7LL-J77-LJ-|J.FJ|FJ.L7LL-JJ--F.FLL.FL7F7J.L--F7--.-JFF7|F-7|F-J7.L-|JF77.
        -F7||7|LFJ.LFL7|.FFJJFL-F.|.|-JJJLF|-||JL7F7|F--7-J||-L7-F7FFJ|JL7JF|.F-|7J|JF|J7J|L|JF7|JFLJ|.|LL|FF-FL7J7FJ|F-L|7|FL7.LF--J7LF-|.|J-|FJJ|7
        L.L|.L-LJ--JJ-FL---L-J--LLF--7J--LLJJF77LFJL--.LJJ--JJ-L.-JJJ7..L7L|J--J.J.|-|.L-7-LJ7JFJ.|J---L.L---.FJLJLJJL-|.L7-JJF7.FFJL-J.LL.L|7-LJ-JL

        """
    }
}
