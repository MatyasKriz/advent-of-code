import XCTest

final class Solution6Tests: SolutionTests<Solution6> {
    override var exampleInput: String {
        """
        mjqjpqmgbljsphdztnvjfqwrcgsmlb
        """
    }
    override var exampleSolutionFirst: String? { "7" }
    override var exampleSolutionSecond: String? { "19" }

    override var outputFirst: String? { "1804" }
    override var outputSecond: String? { "2508" }
    override var input: String { input6 }
}

let input6 =
"""
lrgrvgvttzmtmtgglmgmccpclppvdvtvvllvggvrggbwwlzlmzzbppnvpnvppcjjzhjhthnhjnhhhndhnnnsbnnhzzvhhplplzlrzzgpzpwzpwwsvsjvjfvvphpspwswrswscwscwsscffspsbbjjcjwjrwwtgwwgswswwzbzddqnnpqnpnqppwzwszsnsjjpddhvvcbbhhpzzlpzlzppfpvvmcmvvflfttrltrlldlglbgblltqtffrtrwrzwwzmzwmwwlzzhttwzzwnnmrrcdrdjrjqjvqvvjzzgccrllhmhzzfnfwwtzwzwpwhhdjhhmzzbbvggzdzccbzbbpcpqccjbcbppsttdjdnjnppjjnmmszmzgzddtctvctcvttgtbbzqqggnmmdllvdvmvzzhfffzvfvtfvtvwwcnwnvwwbccggjcjqcqcbcrrppdqppdzpzqppttjhjdjqjppzgzjjpllwrrbttrvvzzbhzzqppndppwqppnrpnnttfwttsrrgprggmtmhmzhzczwzmwzwrwqwrrrdqrrvssnlngnppfqqgbgjjcttbgtbtmtctmcmcmgmsgsffhghqhbbvtbbtltmltlnlpnngcnggbngbnnzgzccgcpgcpcjppnnzjzdjdggzjzljjhnncgcjcscfctcvttvqtqmqjjsqjqpqfqhqmmlvvmppfrfjjngnnfllrlhhppcjcbjcctgcgtcgcvgvffqfcfpcpdpffrbrvbvnnphpqpfqqtnttmtgtlgtgzttnvvpwvwvcwcfwcwmccwlclqlflpflplwpllndlltlqtlqqmqnqmnqnvqvrrtddqndnrdnnpzprrqnnggvqvhvpvptvvvzwzrwwscsqqmcmttbgtgpptzptzzvszvzdvvtsscbbrpptssltssztszttlvlqljlgljlhhwvhwvvqhvqhqrhqqcnqccnbcbppbffzqfqsfspsqsjjrhjjchcmhmnhmmzjmjmfjmmsbsvvgcggtdgghchrrpnnrttnthtdtmmhmdmppmgpgllrwlrwlwvvlmlglppzttsvsbsnbncnjnffddzcddbzzbzgbghhhtltwtggljjggsdswwpmmfhfsfvfrrgmrgrfggvzzbnbttwqqdcdppqcqpcpqpjqpjpbbgjbgjjfwfwpfpgpzgzmzgzdzzpwzwqqjqfqllgrgjjfvvqnvncntngnhgnhgnnzvvbsbmbqmqwmqwwhbwhhsccvhcclncnqccnvnzvvdgvgnvnttmbbhccwgwttlwtwqttqcqmcqcdcmmjpmmjsjhhprrnnqddjwdjjvvhvgvssthhnfhnnntfthhtggthhbrbrjbbjfbjjrgrsrjrqqqfwflfclflnnnnvggfqgqzzbbvttfcfvcvsswvssnzndndvnvqqznnrjnnsmmptmppncpchcctwtbbgbqqjqtqsqfsfvfvnvmvzzpgzppdzdvdqdjdnjnttvvjbbzrzqrqwrqrbqrqsqpspjssnqnpqqnjndjjzmmvbbrqrccrffhwhggbttpnpphwhhmrrndrnddzqzzfbfwbwnwtwjjwjmjsjcjgcjjfcftcffvpvwwbffgzgnnlfffnddtdbdlbbcjbjmmfpfzfbbwbdwwfmfpmmfjfffvzvdvvhrvrcvcscjjpfjjnfnzzrtrpphtppzrppwhhphthltlllttghgwwvlwlflhldlzzmbzzjppnwppvlplqqbtbwwccswccqzzjhjbbhbnhnshnsslmmlqqjfjrjjmvvhpjqhzqffhsdsbwpjvgpvmbfqltrmpnwfcptpfmtjcpbzfldbhcmzchshrlbjgggrfjcqhzqqvbzsczmbgqmzqmltlrtlbnsfvmlhbbcqbbltjpdrpznrglshvgdnqwlhthghvtbffddcjwgdzfswzbppjtdhstcqqmvzmjrvfjbhmrznwqczdjjclnhbmtdvvzwttwnrlfqwpglpcppdwdcvfqpqfnmbvzvmqlmnlgnrsqdjvtsftgnlrtzsrcqhltmhzhpmzqqfqrjwhqfnqdtnshwgfhcpjrlplnqczdlntnhsczrgfhflsfbmftsbptflqbpwblrfnfzvqtpblftmscpzgdhhsbdbjhqclnptwtmhbbfglmvwnbqgvqhmmswwjpfwqjbvznmcpdzcvbzjmfqnwstvvtdnlvnpznnblfqzjjrjgnsbtmmbjzsvmgwddtnzcvhvtdrmjgtcrjzznrssscrzcfbfpgpnpppsqcqpccnbdjnwrbvhrcwgqncjrzbdhzqpfhqbnvbfrzmlfbfvtpggrtdswnvlsvpjsmfchhpbbszbnqqfrmhpqzdjhmhmnnmplbtrpgphvvqdfbcfnrfrbfbtshlmlfltjnbmggqntvhdnlvtcvlhmlrlfzfrqmlwqzrdghvdvtsqvmpdjrjclmlmgjqwzzldnzvfmwmrrnfghsvpcwjdtlnrhpjczwpgfbhpnmcbpthsndfflbjhnlwdbbmlttfqcmswvppslptgzbvfgppvpnhjccrpgrpwtngmmccjghhcwddmnglschnpjwqtrtsvggnpzvsqshfvcnhptphtlmqmpznfzwvbnhwpsfwvpflsdjcjgfzjprbbfzgdbmrjgwrgfdphghrhnpvfncrdzcwtthmqtdwlhjsdthqpzhbjpgggndtrmwvcsqhzrzwbhtqsqthvqncprvnpsrlpvlvcjrcflhbdhrfthlfnqbzbmvlvhmbjnbbjhpjwlfflfhpfwcwnnsljthvzwprqjmgpldlzjnjtjfjrgnrpzpvzfcsrprbjhwnmccwhppjrlnndjdjzqwpcwnvqwgmnwbrjqqvbplvsncnmdfrbhrrhghfllhrghzmlnltgdsqlgbvnlchgcbqlpqptdwmsjpqrprlhqmstzjfnzgbgvlfshwpcrgzcqmmfwvhwlsdvplmdgrtfrjwpfvhnjqdbwsfcqhchstlzfpdljgvcqsfcnqccnpmvsqbmwjtzwhpglhbjwzmvgqwjhvwfhnlbtsgljzmlldcpjwdcfppmnmphdmhpmdqwwtjtrdhlrjlvzgpbcgvwcmtclgpqwhtpbdtdbdscfzbrzmgjlbppcnvphphfnvzdzzlvfsvsgbgqcnlqwmtcrpwzcvnmnvtmcdsstvqpqzdpvtdsbvtwhdvgzqmzvwlspgbwmlnsrqdqnjwrllncflqsrzdqtjqvpnpjlqfwqtlqfqwlltszcwtpmjtldjgvmvptpmzqhwmlvjgnntpvcslmhlhdbjtjjnvsbnzwtdclwbzrvlqzjljtbdjvwgbwcltvnbhfvtgqrbmzbbfvldhmdvfvtlqglnblfmmpjqmzlnfjltsqdrgmlhbhngrrmhnjndggsdcfmtssmmtmzvhzrmwjsqjcvbsgqgtvdmvqlvlrvglrtlshfdmfrmljjggwjbcsztsjmjftcbbjwrmgqvssrvtgzcgthtlgsjspfmdgwptjdrbswqlpfsbtjlnhllmjpbfhgpfcprpdnqqvqdmcbqhbcqtstvnjdzwzwvhhwmcvcfbdwczpwpdhvnstjnbblbprzsccmwrzgfhmrpvzfztvsrtncdhzhptpfqtnqwvqtwdpvcqztgjgrcbdnvqftphtfbtqdhrffdrdmwsbpvhshzvjbvsrljnzddmmfgcnfdssvzdbsfwmfjsdnslbrqsqfwfqbqszjwvgcjbhrfjcnlfhzvhcbbbpmhhvjdtgrqlcchqtvnhlrgtssllvgcdjrlzlzfbrrrvwvvcgfjdlpscsqljmmwmvwnvrgdmgcbvmwmgprbfrbgptlfjbhrmczwrzwbdhdvtgvldnzfgcngdfhbgqsfzlrbwbvdflrrsrcwthjzvgmdtndgtsjtswfbdqvcjtsdvrvqpmmdlghsdbzplgpfnstplpjdvttgzmnhssftqcqjvdvvdrmltbrpsjvqwbljrqrtqldzbwzznsdstvmdzbrvvtgrrphmbrzwnjbmqvfhljcdlbzqtcbjsfqdqcr
"""
