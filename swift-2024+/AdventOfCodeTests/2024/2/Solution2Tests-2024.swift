import Foundation

final class Solution2Tests2024: SolutionTests<AoC_2024.Solution2> {
    override var exampleInput1: String {
        """
        7 6 4 2 1
        1 2 7 8 9
        9 7 6 2 1
        1 3 2 4 5
        8 6 4 4 1
        1 3 6 7 9
        """
    }
    override var exampleOutput1: String? { "2" }
    override var exampleOutput2: String? { "4" }

    override var additionalTests: [AdditionalTest] {
        [
            AdditionalTest(input: "3 1 6 7 9", output2: "1"),
            AdditionalTest(input: "1 2 3 4 4", output2: "1"),
        ]
    }

    override var output1: String? { "663" }
    override var output2: String? { "" }
    override var input: String {
        """
        45 47 48 50 51 52 54 51
        23 26 27 30 30
        40 41 44 47 49 51 55
        12 15 18 19 26
        78 81 83 84 83 84
        5 7 10 7 4
        28 30 32 29 29
        65 68 70 73 76 78 75 79
        5 7 8 6 9 10 12 17
        63 64 64 67 68 71
        34 37 38 39 39 40 37
        72 74 74 75 76 77 77
        57 60 61 62 62 64 68
        12 14 15 16 16 23
        82 83 87 90 91 93 95 96
        25 27 31 32 29
        20 21 23 26 30 30
        34 37 38 42 45 47 51
        24 27 30 34 40
        10 13 15 16 18 20 26 27
        76 78 83 86 83
        49 51 56 59 60 62 62
        27 28 29 32 39 43
        55 56 62 63 66 73
        21 20 23 25 28 29 30
        79 77 80 83 85 86 87 86
        29 26 28 30 30
        48 47 50 53 55 57 59 63
        12 10 13 15 16 17 19 26
        50 49 51 52 50 52
        87 86 87 86 83
        60 59 60 59 61 61
        32 30 33 30 34
        44 41 39 40 41 48
        27 26 28 28 31 33
        16 13 16 16 17 19 21 19
        39 38 38 40 42 44 46 46
        57 56 58 59 61 64 64 68
        47 44 46 48 48 55
        16 15 19 22 23 25
        11 8 9 13 15 16 13
        4 2 6 8 9 9
        15 14 16 17 21 25
        37 34 38 39 41 46
        88 85 92 93 94
        83 81 83 85 91 93 91
        40 37 40 42 47 48 48
        72 69 70 72 74 80 81 85
        18 17 19 21 26 28 33
        39 39 42 43 46
        53 53 54 56 58 59 57
        80 80 81 84 84
        73 73 75 78 80 83 86 90
        74 74 77 79 80 86
        78 78 81 83 82 85
        24 24 22 24 22
        28 28 31 29 30 30
        62 62 65 63 64 68
        49 49 52 49 52 55 61
        85 85 85 87 89 90 92 95
        6 6 6 8 6
        75 75 75 78 81 84 85 85
        74 74 75 77 77 79 83
        21 21 22 22 28
        80 80 83 87 88 89
        66 66 68 72 74 72
        86 86 87 91 94 95 95
        62 62 65 68 71 75 76 80
        41 41 44 45 46 49 53 58
        31 31 34 35 36 38 44 46
        83 83 86 87 89 95 98 96
        31 31 32 35 41 41
        79 79 81 84 85 90 92 96
        69 69 75 77 78 85
        55 59 60 61 62 65
        81 85 86 88 87
        57 61 63 65 67 68 70 70
        3 7 9 12 16
        36 40 43 45 52
        2 6 7 9 10 9 11
        69 73 76 73 72
        54 58 61 64 62 63 63
        18 22 20 21 25
        55 59 57 60 67
        51 55 56 56 57
        6 10 13 13 12
        26 30 32 32 35 38 40 40
        54 58 58 59 63
        14 18 19 22 23 23 26 33
        45 49 52 55 59 60 63 66
        52 56 58 61 65 68 65
        1 5 7 11 12 12
        61 65 66 67 71 75
        62 66 70 73 78
        21 25 32 33 34 36 38
        56 60 61 64 70 73 71
        25 29 34 35 35
        31 35 41 44 47 51
        2 6 8 15 22
        53 60 61 63 66 67 68
        70 76 77 80 83 81
        10 17 19 21 23 25 25
        8 14 15 16 18 20 24
        42 47 49 52 54 55 57 62
        9 15 14 17 19 20 22
        14 21 20 22 20
        70 75 73 74 74
        86 91 90 92 96
        33 38 39 38 44
        73 79 80 80 82
        81 87 89 89 91 94 91
        63 70 70 72 72
        72 78 78 79 83
        8 15 15 17 19 25
        60 66 69 70 74 75 77 79
        19 24 25 29 28
        28 34 38 40 42 42
        24 31 34 35 39 43
        11 17 18 21 25 28 34
        63 69 76 77 78
        28 35 37 43 41
        71 78 79 84 85 87 90 90
        25 31 32 33 36 41 45
        36 41 42 43 48 53
        37 36 35 32 29 32
        25 23 20 17 16 13 13
        33 31 30 27 25 22 20 16
        47 45 43 41 39 33
        15 12 11 8 11 10
        63 60 58 59 58 57 56 57
        5 4 3 2 1 4 4
        58 56 53 50 49 51 50 46
        88 85 84 86 80
        47 46 45 45 43 41 39
        45 42 39 37 36 36 37
        69 68 67 66 65 62 62 62
        83 80 80 78 75 71
        37 35 32 29 29 28 23
        34 33 29 28 25
        51 48 46 42 40 42
        65 64 61 57 56 54 54
        52 49 45 44 41 37
        48 46 44 41 37 32
        59 56 55 52 51 44 42 40
        40 38 36 34 31 25 23 26
        93 91 88 83 83
        44 43 42 40 34 31 30 26
        86 84 83 77 72
        83 84 81 80 77 76 74 73
        14 15 14 13 11 8 7 9
        74 75 74 73 71 68 68
        52 53 52 49 47 46 42
        20 21 19 18 17 16 11
        63 65 64 61 64 63
        62 64 63 60 62 64
        36 37 35 36 33 31 31
        70 72 73 72 70 68 65 61
        30 31 33 32 26
        14 17 17 15 14 13 11
        28 31 31 29 28 31
        33 36 36 35 33 32 32
        79 81 81 78 75 74 73 69
        78 80 80 79 78 72
        71 72 71 67 64 63 60
        81 82 81 80 76 79
        62 63 59 58 57 57
        82 84 83 81 78 77 73 69
        76 78 74 71 65
        56 57 50 48 46 44 43 40
        96 97 95 92 90 84 81 84
        70 73 66 65 64 61 58 58
        34 35 28 27 26 25 21
        47 49 46 44 41 34 33 27
        97 97 95 92 90 88 87
        47 47 45 42 44
        70 70 69 68 65 64 64
        13 13 10 7 3
        83 83 80 78 77 72
        14 14 17 16 13 11 10
        76 76 74 77 74 72 71 73
        31 31 29 28 26 27 27
        80 80 77 79 76 73 71 67
        19 19 17 20 19 12
        28 28 25 23 23 20 18 17
        86 86 84 81 78 78 79
        36 36 34 34 31 30 30
        75 75 75 74 72 71 67
        55 55 55 52 47
        64 64 60 57 56
        80 80 76 75 74 72 73
        56 56 52 49 49
        31 31 28 24 20
        68 68 67 63 61 60 53
        43 43 38 36 33 32
        72 72 70 64 66
        40 40 38 32 30 30
        37 37 34 33 31 25 24 20
        62 62 60 55 50
        30 26 23 22 19 17
        94 90 87 85 83 81 78 81
        62 58 55 53 52 52
        90 86 84 83 80 76
        98 94 92 90 85
        47 43 40 38 37 40 39
        39 35 37 36 37
        76 72 69 68 65 64 65 65
        26 22 19 17 19 18 16 12
        42 38 36 39 34
        93 89 86 86 85 82 81
        47 43 40 38 37 34 34 36
        63 59 59 56 56
        70 66 65 63 63 60 56
        95 91 88 86 86 85 78
        43 39 36 32 30
        22 18 15 12 8 7 8
        78 74 73 70 66 64 61 61
        37 33 32 28 27 24 23 19
        30 26 25 22 18 16 9
        75 71 66 64 62 59 56 55
        50 46 45 44 38 35 32 35
        82 78 77 76 69 67 67
        64 60 53 50 48 47 45 41
        90 86 84 83 82 77 76 69
        54 49 48 45 42 40 39 38
        76 70 69 66 65 64 62 64
        12 5 4 3 2 2
        49 43 41 38 37 34 30
        95 90 89 86 85 80
        82 77 74 72 71 73 70 68
        50 44 43 42 40 38 40 42
        51 44 42 45 45
        22 15 17 15 11
        32 26 25 27 26 23 17
        32 27 27 25 22
        43 36 36 33 35
        74 68 66 63 63 60 57 57
        45 40 38 38 35 31
        64 57 56 53 53 50 49 42
        92 87 83 82 79
        55 49 47 44 40 43
        34 27 26 24 22 18 18
        95 88 85 84 80 76
        76 71 67 64 62 56
        68 62 60 59 52 50 47
        28 22 19 13 10 13
        90 85 84 77 74 72 72
        81 75 70 69 66 63 62 58
        68 62 57 56 55 54 52 46
        73 76 79 77 76 73 72 72
        97 97 95 94 94 93 90
        67 68 62 60 57 56 58
        41 45 47 50 51 54 56 60
        75 75 75 76 73
        84 84 81 83 86 90
        11 11 6 5 1
        27 27 30 32 36 38 43
        57 53 51 50 48 44 44
        39 32 31 30 29 30 31
        89 93 94 94 96
        56 63 70 73 75 78 75
        48 46 48 52 52
        31 35 35 38 41 44 47 51
        96 92 89 92 88
        23 27 26 29 34
        45 41 40 39 40 38 32
        36 36 38 42 44 46
        66 65 66 69 70 72 77
        13 13 16 15 15
        78 76 78 79 86 87 85
        10 10 7 3 1
        52 49 51 56 60
        3 5 8 9 16 19 23
        13 18 22 23 23
        45 45 43 42 45 42
        73 66 65 63 66 63 57
        26 27 26 25 21 18 14
        28 28 29 31 33 39
        91 92 89 87 82 81 78 74
        88 88 91 91 94 95 95
        66 65 64 62 61 58 58 57
        50 45 44 38 36 39
        22 15 13 11 7
        39 38 37 40 45
        74 70 65 63 60 57 57
        26 22 21 21 20 19 19
        55 52 50 46 43 36
        77 76 74 75 71
        27 25 25 28 30 33 36 36
        67 67 68 70 71 72 75 75
        95 91 88 87 89 86 84 83
        6 5 9 11 13 14 15
        25 25 22 20 19 22
        80 76 74 73 72 72 67
        51 51 48 47 47 47
        23 16 13 11 10 10 7 9
        27 31 34 36 37 42
        72 73 76 79 81 80 84
        7 4 6 7 8 10 13 15
        19 21 19 15 18
        75 73 68 67 64 65
        85 81 78 77 76 72 71 69
        66 68 70 69 71 74 75 74
        28 27 24 26 29
        78 74 72 70 68 65 58
        91 84 82 78 77
        49 53 52 55 55
        52 54 57 60 63 62 64
        33 33 30 28 25 22 18 14
        99 98 94 91 88 85 83 83
        62 64 70 72 79
        28 28 30 31 31 32 36
        83 79 74 73 72 69
        49 53 57 60 61 62 63
        50 56 57 63 65 67 68 72
        77 84 81 84 81
        40 43 45 42 38
        58 61 64 71 73
        54 58 61 62 65 68 68 74
        7 8 11 14 18 21 23
        13 10 9 8 7 6 6
        38 41 39 37 34 30 29 26
        49 55 57 54 55 55
        78 75 76 75 75
        4 8 10 13 14 15 15
        79 84 85 88 89 89 86
        91 90 93 90 93 97
        33 32 33 38 40 41
        13 15 12 14 9
        48 46 48 49 54 54
        34 35 35 33 29
        38 40 41 45 50
        51 55 56 60 63 67
        30 33 35 38 39 42 42 48
        70 74 77 80 81
        14 12 14 11 13
        53 58 61 62 63
        13 13 12 9 6 5 5
        56 59 60 63 65 66 68
        16 14 11 9 7 4 1
        82 80 78 77 76 75 73
        33 32 30 28 26 24 23 21
        40 41 44 47 50 51 53
        22 25 26 27 28
        73 71 70 67 65
        37 36 35 34 32 31
        72 70 67 64 61 60 59
        6 9 11 12 15 18 20 22
        81 83 84 86 88 90
        12 13 16 19 20 23
        62 64 67 69 72 75
        19 17 16 14 12
        76 74 73 70 68 67 66 63
        90 89 86 85 83 81
        13 16 19 21 22 25 26 29
        22 23 24 26 27 30 31
        28 26 25 23 21 20 17 14
        65 64 61 60 57
        20 23 24 26 27 28 30
        65 63 60 59 57 55
        57 56 55 54 53
        13 16 18 21 24 27
        58 55 53 51 50
        36 34 32 29 26 24
        82 79 77 76 73
        43 46 49 51 54 55
        29 28 25 24 21 20 19
        56 59 62 64 66
        48 45 42 41 38 35
        35 34 31 28 26 23
        44 43 41 40 37 34 31 30
        43 46 49 52 53 54 55 57
        63 64 66 68 71
        92 90 88 87 85 84 81 80
        62 64 65 68 70 72 74 77
        48 50 51 52 54 57 58
        21 24 26 29 32 33 36 39
        83 81 79 78 75
        6 9 10 11 14 16 17
        22 21 18 17 15
        18 17 14 11 10 8
        83 84 85 88 91
        32 31 30 28 25 23
        28 30 33 36 38 39 40
        21 19 16 15 12 10 7
        13 15 16 19 21 24 27
        17 15 13 12 9
        61 62 65 66 68
        32 30 29 26 25 23
        69 68 65 64 62
        66 68 69 70 72
        69 66 65 63 60 57 54
        50 48 45 42 39
        12 15 18 19 20 21 24
        87 85 83 82 81 78
        56 57 60 61 64 66
        58 60 61 63 64
        23 26 28 29 31 34
        6 7 8 9 12 14
        66 69 70 73 76
        68 71 72 74 75 78 81
        27 26 23 21 19
        25 26 29 31 33 36 38
        4 6 8 11 14 17 18 21
        41 43 45 46 47 50 53 54
        16 18 21 24 26 28 29
        59 56 55 53 50 48 47
        88 85 84 81 80 77
        8 9 12 14 17 19
        9 10 12 15 17 18
        69 67 66 63 60 58 55
        61 63 66 67 69
        74 73 71 68 65
        4 5 8 10 13
        47 45 42 41 39
        11 13 15 17 20 23 25
        69 70 72 73 75 76
        89 90 91 93 94 97
        32 29 28 27 26 25
        13 11 8 5 4 2
        32 33 36 39 42 45 47
        54 52 50 48 46 44 43
        17 16 15 13 10 7 4 3
        52 49 48 47 46 44 41
        18 21 23 24 27
        80 81 83 84 85
        76 74 71 68 67
        32 34 35 37 40
        10 13 15 18 20 21
        52 55 57 60 63 65
        30 31 33 35 38
        52 50 47 46 44 43
        19 22 25 28 30 33 36 38
        76 79 81 82 84 85 88
        67 65 63 62 60 59 57 54
        26 23 20 19 18 17
        83 84 85 87 89
        16 17 19 22 24 26 27
        53 54 56 58 60 63 64 65
        42 44 47 48 49 51 52
        31 28 27 25 22
        21 18 17 16 15 12 10 8
        41 43 44 46 47 48 49 52
        40 42 45 48 49 50 51
        31 29 26 23 21 18 16
        9 11 13 14 16 18 20
        21 18 15 13 10
        91 90 88 87 85 84
        57 60 63 66 68 69
        30 31 33 34 35
        62 61 60 58 57 55
        41 44 45 46 49 51
        66 68 70 73 75 76 79
        60 61 63 64 66 68 71
        35 32 30 29 27 24
        21 22 24 25 26 27 28
        53 54 56 58 59
        14 17 18 20 21 24 26 27
        13 12 9 8 7
        65 66 67 68 71 72 75
        50 52 54 55 57 59
        15 13 11 9 8 5
        9 10 12 13 16
        21 19 17 16 13 10 7 6
        84 83 80 77 75 72 70 68
        41 40 37 34 32 30
        19 16 15 12 9 8
        42 45 47 50 52 55 57
        65 64 61 60 59
        93 91 90 89 88
        4 5 7 8 9 11 13
        75 74 72 70 68 67 65
        36 37 38 39 41
        29 32 35 38 41 44 47
        50 51 54 56 58 61
        76 75 72 69 67 65 63
        75 78 81 83 85
        60 62 63 65 67 70 71
        88 86 83 80 79 78
        63 62 59 56 53 52
        14 16 18 19 21 22 23
        50 52 55 58 60 61 64 65
        50 49 48 47 45 43 41 40
        37 39 41 42 43 45 47 48
        93 90 88 86 84 81
        44 46 48 50 53
        18 20 23 24 26 29 31
        31 33 34 37 40 41 44 47
        26 29 30 32 34 36
        68 70 71 74 76 77
        65 64 63 62 60 59 57 56
        3 5 8 11 13 16
        37 36 34 33 32 30 29
        85 82 80 78 75 73 71 69
        91 90 88 86 83
        65 62 61 58 57 55 53 51
        56 57 60 62 64
        2 3 5 6 7 10 13
        63 62 61 60 58 55
        7 9 11 13 14
        58 55 52 51 50
        30 31 32 34 37 40 43 44
        57 58 59 62 64 66 68
        65 64 62 60 57
        65 62 61 59 57 55 53
        21 18 16 13 12
        48 47 46 45 42 41 38 36
        40 39 37 36 34 31 28
        84 85 87 88 90 91 92 94
        58 57 55 54 51 49 47 44
        41 43 46 49 51 54
        84 85 88 91 92 93 95 96
        16 15 12 11 8 7 4
        52 54 57 58 60
        48 45 43 40 38 37 36 33
        91 88 87 84 82 79
        88 85 82 81 80 79 76
        45 46 48 51 53 56 57
        43 44 45 47 50 51 52 53
        61 60 57 54 52 50 48
        89 88 86 85 82 79 76
        81 79 76 73 70 68 66 63
        84 87 88 90 91 93
        42 41 38 36 33 30 27
        49 50 53 54 57 58 59 62
        39 41 43 46 47 48 51 53
        85 86 88 91 92 93 95 98
        90 87 84 81 80 77
        64 63 62 59 57
        71 72 73 76 78 79 81
        43 41 38 37 36
        56 57 59 60 62 65 68 71
        45 43 40 39 37 34 31 29
        30 32 35 36 38 40
        90 87 85 84 83
        1 3 6 8 9 10 12 13
        52 54 56 57 58 61 64 65
        69 66 64 62 61 58 57
        89 91 92 94 96 98
        69 72 73 75 77
        76 73 70 69 66
        54 56 58 59 61 64 67
        34 33 31 30 29 28 27 26
        48 47 45 42 40 37
        69 72 74 75 78 81 83 85
        31 33 36 37 38
        43 45 46 49 52
        38 41 42 43 45
        76 79 82 83 85
        55 53 51 50 49 48
        17 18 21 24 27 30 33 35
        42 40 39 38 35 32 30
        33 30 28 26 25 22
        34 32 29 27 25 23
        12 13 15 18 19 21 23
        33 35 36 38 41 44 46
        42 43 44 45 47
        18 20 21 23 25
        27 30 33 34 35 36 38
        28 26 23 22 20 17 15 14
        84 83 82 80 78 75 72 69
        17 18 19 20 22 25 27
        68 71 73 74 75 78 81 84
        69 66 65 63 60
        50 52 54 55 56 57 60
        10 12 14 16 17 18 21 24
        72 74 75 78 79 81 84 87
        77 74 73 71 68 66 64
        75 72 69 66 65 64 62 59
        90 87 84 83 80 79
        60 63 66 68 69 72
        35 37 40 42 44 46 48 50
        61 60 57 54 51
        12 11 8 7 4 1
        15 18 20 21 22 24 25 28
        4 5 7 9 10 11 13 16
        98 97 94 93 91 90
        34 35 37 40 42 43 46 48
        14 16 18 19 21 22 24
        71 72 75 78 80 82
        49 47 45 44 41 40
        85 86 88 89 90 93 94 96
        81 78 76 74 73 72
        63 65 68 70 71
        62 63 64 67 70 71 74
        78 76 73 70 67
        59 58 55 53 52 51
        52 50 49 46 45 44 41
        81 78 75 74 72 70
        28 31 33 35 37
        50 53 56 58 59 60
        36 33 30 28 27 24
        92 89 86 83 82 81 78 75
        35 33 32 30 27
        2 3 6 7 10 11 14 15
        21 22 23 26 29 31
        31 28 27 24 21 18
        17 14 12 11 8 6
        71 70 69 66 65 62 61 59
        90 89 88 86 85 83 82 80
        9 12 14 16 18 21 23
        46 48 51 53 54
        71 69 66 63 61 60 57
        85 82 80 77 75 74 73
        51 52 55 57 59 62 64 65
        66 65 64 63 60
        54 57 59 62 63
        10 9 8 7 4 2
        53 50 48 47 46 43 41
        77 80 83 84 87 88 91
        78 81 84 85 86 88 91 94
        31 29 28 27 25 23 21
        6 8 10 13 14
        27 24 21 20 19
        16 14 12 9 7
        18 19 20 23 25 26 29
        26 28 29 32 34 35 38
        26 25 23 22 20 18
        28 31 32 35 36 37 38
        1 4 6 9 12 13 15 16
        52 49 48 46 43 40
        76 77 80 82 85 87 90 91
        41 44 47 48 51 53 55
        56 55 53 51 49 47
        75 72 70 69 67
        78 81 82 83 85 87 89 90
        20 17 14 12 10 7 6
        80 79 77 76 74 73
        32 33 36 39 42
        59 62 64 66 67 70
        33 36 37 38 39 40
        1 2 4 6 8 9 12
        25 27 30 32 33 34 36
        17 18 19 21 23 24 26
        33 36 39 42 43 44 46 48
        12 10 9 7 4
        79 76 74 71 70 69
        87 84 83 81 80
        36 35 34 33 31 30 27 24
        42 41 40 39 37 36 33 32
        43 41 40 39 38 37 36 33
        50 51 53 54 57
        64 67 68 69 71
        75 76 79 81 83
        62 65 66 67 70 72 73
        53 52 50 47 45
        26 23 21 20 19 16 15 13
        59 61 64 65 68 70 72
        69 72 73 76 79
        54 55 57 59 60
        38 39 40 42 43 46 49
        76 77 79 81 82 84 86 89
        83 86 87 90 93 94 96 98
        29 31 34 37 40 42 44 46
        64 63 60 57 55 52
        1 4 6 8 11 14 17 20
        39 40 42 43 46
        70 72 73 74 75 77 80 82
        18 19 20 22 25 28 31
        1 3 5 6 8 10 11 13
        55 53 50 47 44 43 40 37
        92 90 87 86 85 82 81 78
        73 72 70 67 64 63 61
        82 81 79 78 77
        37 35 34 32 31 28 27 26
        85 88 89 92 94 97
        87 84 83 80 78 75
        18 15 13 10 8 5 2
        3 6 7 10 13 15 18 21
        96 94 92 89 87
        48 46 45 44 41 40 38
        1 2 3 4 7 8
        25 27 28 30 31 34 35
        97 94 92 89 86
        79 76 74 73 70
        58 55 52 51 48 46 44 42
        85 84 83 81 78 75 74
        57 59 60 63 66
        75 78 79 82 84 87
        90 89 86 84 81 78 76
        60 62 64 65 67
        28 29 31 33 36 38 40
        78 75 72 71 68 66 64
        76 74 73 71 68 67
        57 55 54 53 51 49 47 44
        73 75 78 80 81 84 85 86
        82 84 87 88 91 94 95 97
        74 76 77 80 81 84 85 86
        20 21 23 25 28 29 31
        10 13 15 17 20 23 25 28
        38 41 42 45 48 51
        22 21 19 17 16 15 12
        60 59 56 53 50 48 47 45
        54 56 58 60 61 63
        37 38 39 41 43 44 46
        97 95 92 89 87
        75 78 80 83 85 87
        68 71 74 76 78 79 80
        55 54 53 51 48
        52 55 58 60 62
        40 41 44 46 49 52 55
        39 41 43 44 46
        36 34 33 31 30 28
        44 47 48 51 52
        38 35 34 33 31 30
        49 48 45 44 41 40
        23 26 27 28 31 33 35
        58 57 55 53 50
        39 41 43 44 47 50 52
        74 72 70 68 67
        8 9 12 15 16 19 22 24
        44 45 48 51 52 54 56 58
        25 22 19 18 17 14
        51 53 56 57 58
        21 19 18 15 14 12 9 7
        57 55 54 53 50
        22 21 18 16 13 11 8
        84 83 80 78 76 75 72
        32 30 29 27 24 21 18 17
        28 29 30 32 35 38 39
        69 71 74 76 77 79 80 81
        74 71 68 66 64
        70 69 68 66 65
        39 37 34 33 30
        85 86 88 89 90 91 92 94
        75 72 69 67 64 61 58
        56 59 61 63 64 66
        88 85 84 81 78 75 73 71
        54 57 58 60 62 63 64
        56 54 52 51 48
        36 38 40 41 44
        74 71 69 66 63
        85 86 88 89 91
        38 37 36 35 34
        40 39 38 37 34 32 30
        72 69 67 66 63 60 59 57
        38 35 34 32 29 28 25 22
        30 32 33 36 39 40
        62 65 66 69 70 72 75 77
        41 40 38 37 34 33 30
        14 11 9 8 7 4 3 2
        40 38 37 35 34 31
        93 92 90 88 85 82 79 78
        80 79 76 74 71 68 65
        56 58 60 61 63 66
        10 13 16 18 20 22
        6 7 9 11 13 14
        97 96 95 93 90
        17 19 22 24 26 29 30
        74 73 70 69 66
        39 41 42 44 46
        47 44 41 40 38 36 33
        77 78 81 82 85 87 88
        85 82 81 78 77 74
        60 57 55 54 53
        59 60 61 64 67 70
        65 67 68 70 73 76 77
        99 98 97 96 93 90
        97 94 91 88 85 83
        74 72 69 67 65 62 61 59
        23 24 26 27 30 32
        39 36 35 34 31
        16 13 11 8 6
        34 36 39 42 44
        81 78 75 73 71 68
        14 11 9 8 7 6
        89 90 91 93 96 97
        45 47 49 50 53 56 58
        8 11 12 15 16 19 20
        74 77 79 80 83 84
        55 54 53 52 51
        36 33 32 30 29 28
        77 76 73 70 68 66
        74 75 78 81 84
        34 32 31 30 27 26 25 24
        11 9 6 3 1
        74 71 68 67 64 63 60
        62 65 67 68 71
        52 53 55 56 58 61
        11 13 16 17 18
        77 76 74 73 71 70 67 65
        54 51 49 48 47 45 43 40
        17 14 12 11 9
        74 73 70 68 66
        36 39 40 43 46 47 50 52
        92 91 89 87 86
        79 76 75 72 71
        98 95 93 92 89 87 85 83
        7 8 9 12 15 17
        39 40 43 44 45 47 48
        60 59 57 56 53 52 50
        28 27 26 23 21 19 18
        40 42 44 46 48 50 51 54
        15 14 11 10 7 6 3
        23 26 28 30 33 36 37
        15 16 17 19 20 21 24 27
        43 42 41 38 37 34
        52 55 58 61 63 64
        76 75 72 71 68 65 63 60
        52 50 49 48 47 45
        68 70 71 74 77
        58 59 60 63 65
        56 54 53 51 49 48 46
        62 65 66 67 68 69 70 73
        11 10 9 8 7 5 2 1
        43 40 38 35 33 30
        77 79 80 83 85 87 88 91
        16 14 11 10 7
        69 68 66 65 62
        76 77 79 82 85 86 87
        17 15 13 10 8
        81 83 86 88 91
        42 40 39 36 33 30
        38 36 35 32 31
        47 46 45 43 41
        95 94 91 90 88
        5 6 7 10 13
        41 40 39 36 35
        65 62 61 58 57 56
        13 10 7 5 4
        69 72 73 76 78
        15 17 20 22 25 26 27 29
        5 7 8 9 11
        39 36 33 30 27 25 23 21
        73 70 69 67 64 63 62
        32 35 38 41 42 44
        79 80 83 86 89 92 93 96
        43 41 38 36 35 32 30 27
        48 49 50 53 54 57 59
        32 29 27 26 23
        92 91 90 89 87 85 82
        22 24 25 27 28 29 30 33
        20 22 23 25 27
        71 69 66 65 63
        43 41 38 35 32 29
        71 69 67 64 62 59 58 56
        61 59 57 55 52 50 48
        57 56 53 50 49 48
        78 77 75 74 73 71 68 67
        85 82 80 78 77 74 73
        18 20 22 25 27 28
        40 41 42 45 46 49 51 54
        23 20 17 16 13
        72 74 75 78 79 82 85 88
        39 42 45 47 50 51 53 54
        31 32 33 36 38 41 44 46
        30 29 27 26 24 23 22 19
        45 42 39 36 35
        76 74 73 71 68
        44 47 48 51 53 54 55
        48 46 43 41 38 37
        90 89 86 83 82
        59 57 56 55 52 51
        34 31 30 28 27
        39 36 35 32 31 28 27
        84 86 87 90 93 95 98
        95 92 91 88 85 84 81
        23 25 28 30 31 34 36 39
        7 8 11 13 15 18
        80 77 74 71 68 66 64 63
        36 33 30 27 26 25 24 23
        96 94 93 90 89 87 85 82
        18 16 13 11 10 8
        80 77 75 74 71
        82 80 79 78 77 74 73
        18 17 16 13 12
        91 88 87 85 83
        41 43 46 48 49
        74 72 69 68 66 65
        59 62 65 68 69 71
        44 46 47 50 51
        59 60 63 66 69 70
        26 25 24 21 18 15
        40 38 35 34 31 30
        84 87 90 93 96 98
        39 42 44 46 47
        22 25 26 27 30
        14 11 9 8 7 4
        81 84 85 87 90 91
        98 97 96 94 92
        79 76 73 70 67 64 62 61
        80 81 83 85 88 91
        91 88 87 86 83 82 80
        51 54 57 60 62 64 67
        34 32 29 27 25 23 22 21
        62 60 58 57 54 53 52
        16 19 22 24 27 29 32 35
        26 23 21 20 18 16
        15 14 11 8 6 3 2 1
        49 46 43 42 41 40
        52 54 57 59 61 62
        87 85 84 81 78 75 72
        77 76 74 71 70 69 67 65
        77 74 71 70 69 67
        66 68 70 73 74
        15 13 11 10 9 7 6 5
        52 55 56 58 60 62 65 66
        80 78 75 73 70
        88 89 90 93 95
        76 74 71 70 68 67 66 64
        87 84 82 80 78
        76 75 74 73 72
        73 74 76 79 80 83
        41 38 37 34 31 28 27 26
        17 18 20 22 24 25
        9 11 12 15 18
        29 31 33 35 38
        99 97 95 93 90 87 85
        91 88 85 82 80 79
        9 12 13 14 16 18 20 21
        84 81 79 78 77 75 74
        21 19 17 16 15 12
        67 65 64 62 59 57 56
        68 71 73 75 76 78 79
        68 70 72 73 74 76
        33 30 27 24 23
        22 25 28 30 32 34
        15 18 21 23 26 29 30 32
        73 70 69 66 64 61 58
        83 82 79 78 75 74 71 70
        76 75 73 70 67
        49 52 55 58 60 63 64
        33 34 35 38 41 43 44
        52 51 48 45 44 42 39 37
        91 92 93 95 97
        8 9 11 12 13 15 18 19
        64 63 60 59 56 54 52 51
        63 61 58 56 54
        18 16 13 11 10
        69 66 63 62 59 58 55
        19 18 15 13 12
        58 59 61 63 66 68 69 72
        23 26 29 32 34 37
        28 26 24 22 19 17 16
        66 69 72 74 75 76
        20 23 25 26 28
        3 4 5 8 10
        60 57 55 52 51
        15 18 19 20 21 22 25
        46 49 51 53 56
        58 56 54 51 50 47 46 43
        60 63 64 67 68 71 74 76
        4 7 9 12 14 15 18 20
        29 32 34 35 38 40 43
        21 19 18 16 14 12
        83 82 80 78 76 73 72
        64 66 69 71 74 75
        12 14 15 17 20 22
        76 75 73 70 67 64 63 62
        32 31 30 27 26 23 22
        61 64 66 67 69
        98 96 94 91 88
        44 42 40 38 36 35 33 31
        37 36 34 33 32 30 28
        25 27 29 31 33 36
        78 75 72 70 69 66
        47 44 42 41 40 37 35 32
        71 69 66 64 61
        16 15 14 12 11 9 8
        93 90 89 87 85 84
        49 52 53 56 58
        40 38 37 34 32 29
        97 95 94 91 90 88 87 85
        67 68 70 72 75 76
        35 32 31 28 25
        85 86 87 90 93 95 96
        41 40 38 37 35 32 29 28
        6 7 10 12 15 18
        86 89 90 91 94 96 99
        50 52 53 56 59 62 65 68
        50 51 54 55 58 60 62
        73 72 70 67 64
        7 9 11 12 14 17 18 19
        24 26 27 28 29 32
        78 75 73 70 68 66 64 62
        79 82 84 87 89 90 91
        46 44 41 38 37 35 33 31
        25 23 21 18 15 14 13 12
        4 6 9 12 15
        94 91 88 85 82 79 78
        15 13 12 9 7 4
        69 68 66 64 61 59 58
        40 43 46 47 49
        80 83 84 86 88 90 91
        53 50 49 48 47 44 43 41
        68 69 70 72 73
        56 55 54 52 49
        35 38 39 40 41
        44 41 38 35 33 30 29
        32 35 37 39 40 43 46 48
        16 15 14 11 10 9 6
        10 11 13 15 18 19 20
        37 40 42 45 48 49
        21 19 18 15 12 9 7
        68 70 73 76 79 80
        70 67 64 61 60 57
        49 52 54 56 58 61 63
        91 88 85 82 81
        23 22 21 19 17 15 13
        72 73 75 77 78 80 81
        73 72 71 70 68 66

        """
    }
}
