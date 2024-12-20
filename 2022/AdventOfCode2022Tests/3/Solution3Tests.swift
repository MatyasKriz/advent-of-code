import XCTest

final class Solution3Tests: SolutionTests<Solution3> {
    override var exampleInput: String {
        """
        vJrwpWtwJgWrhcsFMMfFFhFp
        jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
        PmmdzqPrVvPwwTWBwg
        wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
        ttgJtRGJQctTZtZT
        CrZsJsPPZsGzwwsLwLmpwMDw
        """
    }
    override var exampleSolutionFirst: String? { "157" }
    override var exampleSolutionSecond: String? { "70" }

    override var outputFirst: String? { "7980" }
    override var outputSecond: String? { "2881" }
    override var input: String { input3 }
}

let input3 = """
GbccTtTSGGbgrcWBGGrdgTnVQnCmNpCJlNnNPVfClcnN
vMzvZhzhwDLVmQnClwwNQp
FRsZFzjQFsqRzRRjDZbdtTgdHBBWGrdBdHHs
HCLTmbCLgzNBNPSSlT
JJGMWRJMrrdwWWGjGWMLRGLjBzNQsBzPPfflzDPBsBffDrQz
pwJdLMjdMddWjLtwZWMMwGtHhnvnCnhvqVFFZnvbgbqVCZ
tvMCDCSVVvDDBQFRbqWMMsWgFWgc
BLLPTpBmfLPrHLLfLsbhRqbzRRcRHgqssR
dfdNLmPTdNZmZdZPfpmTJLPPSvQjtSGVwQSDJSjSwDQBVCGw
wZWTWNFqzwZbWNpSgGMVMtTHsgGs
nlnPnPvLQjzdtsjBHBMMGSHg
LdnrrLnhRdLLmLDRPvmdQnJDJWNqcCqZJZqfFqfcfzcq
vPTbfWggzvGVqjsVqV
dDcJHZcZHmMFQQMshsjcRqVChjNtqh
dDHJDmFnrJmQFnBdMdQHJdZZlWTTPPjTLWbTzLWlTTfwjzBT
VfmDHDfZzfLcZLLLHBFQtRJTcdjgdTgFjjtR
WRPhMlGSshPRGgvFMtddTjjCQt
SPhWPsbNWShsWllswGpzLmzfZwmZfqLVRrDBZB
MtZgRgJJbbGjgDDgbjRjRbGcNdWwncBFdLBBMhFBQwnWnw
vlpsNVsCzzfHpvTpzlSSSvppcQdfnwnWhndWndwfQLhnhcFQ
pCsCCTHVvSzvPvHvzpPVTVHHRJJDgJZjJjqNmjZmDtJRZPNR
GTGTbhhPjJJjBhhZsGzmfHSNsmHHgSdL
FcFpMDFDRFfsRHSjmLjR
CpFjqcCjwjnpwhTPTWBQZZTb
zdzzwDlnTDQQQQnqQqqsFqnrSBSprbpjNJJBJPPdpJfbZb
hgMcRVGMtHgRcNSPrpfgfjJpBp
CLRHVHhtvtvGPWFFDqPDLnqP
jssjjjHCSGCMNJTWWCJT
DvcvBtVrrDSNWcMfLRfM
ppDZSpBhBvBmvDHnFsHHPnGPGbQp
VVVLsLWnjVVBGgScjtBjjLLgmJdPmJmfmhmGmmmNmJGhPNJP
QbqlZqQTZvMHmshvFhPfffFp
CsTRrQrwbCbrZqQTQlRjtDBSBtwBjgVWLBtgBt
FLsSFRTPscHZmGRGGc
npNNptgttCNpgLbnQMgnQnMNqVhGqZrmrmmqrmcrqmCVZwqH
WMWbtpjLgnLNvSfPPzjvjPdv
FcFFhZlhlMrHlSFSrHZMJZSVmmLmVLLCsBtLBCzCBVDRcV
PMGPbndvGfGstLzDCmLB
NwjPqdvPpvgddqgwHrZhJlTlThpWJMZp
SdjStScTWTwwvwwfjRhQPQQQDlLBGpLrPrLrLc
gCqJbNsVsNMgzMJnnqzNlCLGGlZZPrLLlLLtpPDl
JsFJFMmbJqqnJbhSHdjWwjtmHWvS
zBFDGGbNzDWRbDccsWslHlWWsJcS
zMVqTwzPfVfVMwmlcZTZZlSmTlmc
MrMvMCnrMVMCPrPnDFFGgQdFgRdzznbd
rJtJnrnSShJgcCsjjNNMSSDzRmzm
HWDWPBPDBfFVBffqplvlmNlQllvzQNQqlN
FVGHHFVbwBpBPwFFGfBpHVDgrcJCbZcLdCgtcCcJLJrd
MGHGGFFqbFTGmFwLmQsQflFN
WcvBdpjhdZdNwdZwLZ
vWtgVcpvjthtNcjntDhhpSJMSqHzqTzqCVHTSqHPGT
cVHZfjfZMcrSDQMJRCBCQw
PtGddtslsWQDBdwCDDdw
WsvTFnshPTGhGhhlPNGTCnsjgFVfmgfHZfVHgcHZVVFmFV
JFFqfJBgrHBffVHlsBFqfWNgjTtztNnttWWvWNwzwt
hGZbcBcZZSQmZLQRTbvNttTzjtTvbpzv
cmmhRchPZhZSSmdmGPDDdJdBVMffHlqlslfF
qWwTNwNHMHNNMRqMdRMQQMHLmmvzrTmrzPvzJvZvZlvzjZ
FphBpnBhVBSFvLljzZPpmrPL
nGsBbssbcbdlwggdNl
RLSRTLSFFFLPSWpzzTJdzsQpbd
DvqqcwVMDDcfrrnwDcwnvCdpQQphJhJjhdhpzsJhMQ
fGcvDZffcGGZDHGrGrtJRPlPmJSlPLRgNBHg
QlFFmGQFDQrrWlRlWGrnQVCLNvvPwLCwBvCcCcJCLCCm
tHtfsjSMCNPwzvCf
MjqStqMHsMSgjShjTttgphsTlrbDWGDrGlRTlNDbQrQRWRbD
QbChcCJCbHQCjbGCjQfsdsrtTqrfTLrcFftd
DwRzVzzZnzZRwvgRhRWtqsLLWtRdqLLdqd
NMwMzBVVPPSGQhBl
ttTPHWdrJjCdjnFMtLLtLNvQltLh
pSDBwZRBBsgfDGGsGpBVMFPQQlFMFQQFQfNvLNfF
PsppZzBVzwgDwBwwgpSSBssWjqrdCnjjHdmCTHznWCJJWn
WcdHdPcdZrLPDPBQDg
pMjMMqfmJlqNflMlFNRfLBwnLzTTTDJJwDTTGTLJ
hlhbqpbNNbVVdbZtSB
RDBWGRDnzBWBJDNBttSLlclldtQQcTTLFF
rTPVjZZsCZrVhdFMcgLgwFSgQh
PsjHVffbsTCHrCvTPfDJGJHNzzNJWnnnmzDB
LQdFgTLdQjVsQFTRBjMZrmBjWGMGSW
flvJJlJpbNnppCpMGGfBBZSZRfFmGr
NNbNDNlbDpHlbDDplvzvnCbzqsQPFQsTTccsqdQqLgdHLwQw
DnGDNDTFdFwDzCZZRmhThCRRRv
SgrPLrrLsBPbHBCmtVZVCdCcctHH
rSbgBrsqgsPppMBqfpPsLpPGlNGGDwNFNJWDldlllDwJMG
PWbvNWvpvJPnWDGqDjDczj
QwfFFVVQSMlDlQfFZhsHrBrhHHTcjnczqjzqrG
mwMSgfmDmSSFgfFNbmLpbRbJbvbRpC
lsggLLLDGldGTGBBhNTCwRwVnJnNCCnbRV
QQpWrpHtrHrpNRRJNtfbJCVR
PvQQFPzccvBglclNscls
NsszMMNGWLcWBhMF
gTtwvbqfnDTdpvqDftpnnntDZvLFQFBLmRWFRhJZJhLLBRQB
DwrpDbngprPWGllSNrSS
nCqdLPZPMMZLNvtGhRmGhGPmtW
TSrVZVSZVwFTgSVtrtchvWRRrtWtcr
gjbjBjgTjfgfVfHHppBLMnqLMDnqClsZJLLD
hrqShCPCpHHBVBGWQFVQGFGnzQDf
tgvZsbwsbcMbRsgccjDGFvGFfWJLLzFFQJ
TTZmMcgmbmWZMctbbtsHrrqqSHHrCrPBBSCPrT
HHHNZLGLpBpRSvWlGlqhPghqDGnnFr
QCNCMTJdjMjdjsQTbdQmmCQDngFqnggPFcPcnPFcDqcbDn
MNJfzNsfJdJjdzwMNjjTJttSHVStRtZVwHvWRWtZHt
DSbvDdDbbwHgCSgZPwpbPgmTTJhsTTChqTJssQssFmJJ
zzjMNNGMMRcNNhvnvFqmtJJv
WWffvlVrcGzGlcjLvfrVRLHgHgpDPSbPpwwHbWbBbPPH
FCCjjFlFtCjzlpTHtJsQTTcpTT
DWLhWSgDWWdSWLwmmpHHQTHcBTBvvwHvHl
mgGRhrLLgWqnjrfCNlzP
cLsslBlsqNNTHlTVNbLZZLRCQbZZdQdpbP
JGfJhhwfwBBSJPRdZddpZRQbfR
hWmWGgDhJrFhBcWsssWHvHll
lmmvlJFtMHFtQzVSRbPGzLJRgG
BcTcrNBrrwwqDBqNqwcrhLpLPVzRhPRPPPgSGVPLbS
TrDqcnsTcsmnvHtdGtMW
CcnDQpSDcnFcPBrmbPQGBsGB
gCtCfRZTBWbjPRbr
qgvHqgJhMfZTtvHgfTghJgMJDpdppFSLLCcSDvLLcdDwvLcw
ffFgGRMWSTGcnDgllDDpDp
dvSdHBrVSLNVLjdlsllcsDqpsZ
SHHHNrLJLvtNQJVvmMfGRGGRCJWJRwzWMh
JNpNDfDBDHVzwHHzpzBWVBPsvsFNCbmbqsFFNsjCmvsmNC
rnnrtLhnrrQZMvtFbWmqtllcFb
GQRdGQLLhMSQhZLZdgdwwHzPDzSVWzVDwJDVpz
LdcGjgdcrMDSFGVfnnGG
HNsCCQFCPvFFBJnnSBJVfDVJwf
HHFRqHPpNppmQPcpLjzrdgtbgztT
GlZZbclGZsDvlGhsShRnCnMQtjtQjnCQsQRM
PggFVcdFNFNNVVFLPdPdrwpWBMMnqMpnttJMnjMnQqtqQtqq
FdgcdcLwfTmSGTmhlbzG
RGvhGrLhhRhlpChZrGSprBdPPHJJSBgSSHqBWBBffH
mQmjmwtTMTVLzHnTPWffPHHJBf
jMmmwMcVcFLFrlRshZbCrF
SnNgNgBlNZSZdZtMrlnSnnQtjpwFwpvFJwFqpwSbqjjqGRpv
CLCcWHLhLTzsDPcCWMLGpFJbGFwsbvGwJwjpRv
zMCTPhmHWzfhQQmndNllNrQg
dbdBdZrQsrdrGslrrSpLvwHmlTmmwScTHv
FgnJqLDLWqNnNpppmpCSSmCJTw
NNhhnRNfzMhgnMDFfGdGLbBVVdQRtPVZGt
BBQJNTTzTcfRhtjhffqDDWCC
vZnsLsVLSvPwPFFnwPlSPgZWqGjChgWCCWWCMCgGMh
srLLnLmlPwrrPwmwwvlRqzQRJBmppQTTQpTdBN
PLDpZGpWbNGWLDfQmsQDwwsmhm
vTzMMbgCfgHQsmQt
VMlRznlzVnTcFzbMcrpJcNrJdjdpZrLdcZ
SftvFcDSvDHsFtctMSvbdjbpqpRRpRTJrMdrrb
QzQZWZnQgQZwBBwsJdqPjdjrnTpJjs
NGmwmgszhZwwGGgZGmggWLVSVHlNVVtDcDltFVVVlVHt
WCfFBfBHHjHHjgHBjJFVcVRwQMbVrRhrJbRRJM
sZMsDqzZPRrRrVswdc
vvTzDzpDTvpDvZPvSnNZZlSHMCHjjFtWmlttlCjmCF
hJZwhrvhBJRrPQPwRRZLllgLqfcqpTggpcTWMTff
HHDzMztbVgTzNpgf
nGbmtjDMFjDjCHbbbHHHdBQQPBrZvJQRwvwRPZQJGs
NNSrMSHRqWpWNNrNMvLffTBBDmsvcmcJLM
lwPPhcddcGPlBDTDlmDvJJsv
bZhzCdPGGFzVVPwVwbNtcqHrpnpZptSZqRrt
GvvSWhmhWBNcBDNc
FzlRRTljjRTjRRmZfbflRTlFFrrMrcBcDVqBVsNDDJsMFr
bttRfzfRHzjlmlnCbTtzbRShgwHGGvppLdpvwLLGLLhd
MHGMWdBFFNsFFHpWSFddMmqVmVBggmlVfbVffjgZml
hcJsTTscvsLDzDJmqVgfqbqnbmfJbJ
PvRTzsPwLcwCprSdwdNW
qfJnJdLpJzrcqCrCzcGfpRSSVBPRSjSSllTNRBdTRS
DbsbtggsbbsghhgvnWWSlVjPSjmmPBtjPNlTmS
vHHHHDHvZHQvWbWsZDgWhDwWzpfGfzfcpFJzczwFJrfffnGC
sQvsRQsFZvfpGhjhQqjpZvjGJHgngPBNHnCBJBCmSBmBNG
HTHwbtdTDDnCTPTT
zwMlVdzbzLzMWvQZRQZfZZlHsR
QhzWwRBPHgFrWWrH
SDgJCCDCsVpMMqTtFpfpqG
gJNCCddSZNSlljQzPPNBzR
dLzVVjfLGCCdRPrdmBtwWttr
NnbNsbTHJnbHbSHlNQsNtwrJRwBMMBhrPJWZRRtM
QSslpFvpSSsQPFCDqqgzcjCj
fcpGshsfNcNZsmRjNqCtnFgbCgHrrggmrn
QvzBlBBQBdJTBzBwVVMgbrwwLFtLtgLFHCHrbF
dlQQMBSSTPZfPcfssZNC
gNGVMzVpVVTdPDWdRdNT
BfjbnCBjBzffHrbrzBDddQWTZZQTTJTQTHHS
zrFncfBjcjnrrlCLwFgpmvFmwGmVLh
MbngccTfWgbWcTTzZghmLshhLRttpthRDLtf
CdFdJHCJjBvBSCNCNJBjjdjpsPDwDtwvptRPmLmzRwhhLR
qJSCCBFHQBFFldrVZZbggnGTzcZQ
lPrpppllcwwpHprppNdfLbQJnWdLJnncdN
tSjjjSSDGgghRbbSTfTbTFTLQn
jCBgDMbBMGghZzCZmmlrrpwp
FhCDFvvPwCjcLhDjhnvjnsdfZTlflQlflLsppdQfld
zPNSmmHrSSHWBNSMMVGzfGfZTZQZzdpdRGZR
WSNVVMMVtHSVbMNWBHqmwcvhcgwgvwtPvgtPDjtw
jSSSjzZMmgSzzwmZBtHcHmtNdncHtnpNcn
VsLsRsJJsTfRVfLRLJlfLlWqNbDcddncvpvbdvcnpqdpdtHq
GQQTsJGGJLlRGJFWffWLhgZwrZBZFZrhtBjrjjZw
ZfzJPvPnLvRJRfZLDfjfrBcqrgsgDBrcrGgslsms
SNhpqSNhpVTNQSMNgWmrlccVGBBmwrBw
QHHFhhNdTNHHfZPFqtqPRtjq
PMZSPSZZGMspsLhLRqRVzfGjvF
tcwwgcgbcbCrtbbtmQQcCqRffFLhRgqjFjRfhFqhqz
CLQtcbcmwmbdrbBrlrCwQTsTPsPsZNBPNWJpZWpTss
lMTrcHrhChWnRzJrznnr
DDJbPwjLJpfBQjPVBpbsGVGVWnZnsqnZsnzsqZ
wJQLbpPJDLfgPbDNCHNlghNCMhcNcl
tlVZhlVWtnBltVtssZBBbPbcpdPwbPWfvcbLvbbb
NwCTFNFDNdSNPpLpfN
CGwRjwDjzFFGRGjjFRjlBtZqMzVVtVqhMZMBZn
HhFdMFHhgrdjcZtZjr
zvvQQvzwzDMjZTjtcrTDtt
BwMwSvQSVlzQlMQzwzNgGHPGGHFCCCgGhsHLCS
zMVtBhhVhhDhtzBtMTTfDrPbmRRmPbQmrQbNQGRQtR
vLlJHgnLpDvHHvHvmPbSQbQRGmJmPRrb
pspwHClCwqplsHqDsMMTFWsWfjzszf
CmmjLwWSWGCHCjwSmStJBgQcccBhwgQtgthQ
WZVFTpqWsMsZpFddzszbVzJQBnRtrQthchdBgtgRtdrc
bbsMTWsMVsZqNZMpqWDqbMsCjvlCfjGCPlLLPLCmSCfCLN
VzsjjVGhpjJrJHCppprt
WtMnqtWdSQDtMRSnLNHHwHwQvrJrJCPN
tTtWSScTddBqdRMmlsbFBfhVBhfjjF
gLMWzdTgLFQHdlMgMRwcwhqqvPcPhVFRDF
tBnGrSCZNZCrtGBsSNGtBPhcgfchqqDPwVPRvNRqwN
CmrgstjZngtBzbjJlQWWHjjM
qttwGWHtVPzJJPqbmb
NrRvfTTghNrpLrrpLTrNrRrhvJmzmzlbbVVbdbdZlDdvzMPb
rfcprNcfgpLrVNnnCcnnscstFGCF
ZZhTfggZsbshGrfshMrNMCSRMMWqCqMNRq
TVTJPDTFccqMCcJw
BBLBmLTLDHFvsQpfgnZhbQvG
ffSrFvVVmVCQSfVDFzDvDDmmnGWCRqGRWNNqlttnRsNtGnWW
PgZQgPJJpTpTHRGtNRGWqZMWWR
wdTdwgbPJTJgTgLSFBbrQvSrFrVS
ppssshsscCVCHhVWVpznnQRBnZnBbzczFPRS
dqqfJGWttfWGlwwPSbFbZnRFPFtFZS
wGwdGdddLfGgMTJfwLMlJMpTCChjHhjTHpjjhmsDHmHW
PZQBhRPQBQrWHFHqHFHCqh
STQSvvvppzSVHJJFWjHC
TTgTvbsbszcNnnvbncvRGPBRtRgQrDPLfftPPR
dMltttpQhmQVZdmhsdrvNCHvlWbHWvHCWrlr
PzzLTGpGPDzFBzqFGFqFvHWHvRJbbrbWvCvjJCLv
BpqTBzpzfGGTTPZtSddtQmVffSst
bwHbRZldhQQfDWWGDjBf
CzvgpsNMsvCvFvpszpnMsFgBTDBDWPnPVJJZZDJnfjDTff
CpcLsFrMZbhRcdmt
HgjpWlhzpWjhWTQPFdPBRQzTMQ
JsfwrqLttwJVLGhRQGGPBd
CttfrqDmDDtCsbZCHjhZHSHNlgcW
QSdCWlCRhWRdlrlZrDssZsGDbv
pjPrpjqFNrZNGnBbsNDG
wjjVHjfLQRCgdLrC
PjMpRdBdjMSGsjpdprqtwCrNGrrNlthhrG
WQzDzLZDgzZcqlqqrtJclJnh
zbWHQHDfDWZHfLZHfffWVZpRSPpdVvBSPMqVMPjdvspS
TMBJLTJlFHBjFFtMGngpvvpgvQmtNSNngv
bVhsZswRCbbVZWVfVZwVSpmSQPPvNHwPHmgmSSNN
dCCVZZcbWVVcCbbfsLrdjFMJdDDHBTMrjr
vNWcTWnCqNCPPjhhHsQrfgszrTJRQsfRQD
wLdwMBLFBBQJpszJBqzB
lLwVmMSmttVMlSNqcbcbSbNcvHbh
PVfJfDWrPVPPLcPPFWcjPrqlqqQsljRpplqBQpRvSQvs
NdggMTCChMgdChNmdtTbtmsQSRhQslhlpFRpFwllwQvw
CdnGzbGbgMGMdTCZZDDJcZFDDnWrPH
fsshhnfLZSvcVbdcZVJj
RCCSmDFFpRqHQDgWvbGjgjDdbG
pFmFtCSBCSMBBLwrPsBPNlNB
fWWcwbbwbWfGCPgPfvbwgvgcQQqQLsGLJQTZHHrZRsrLqlJs
VnszmsDBpMFpzNFlrlRLRRHZqRHr
VpdzDMNzNDjpsdzdnzDcPCwtWCjhbthvfgtgwP
SPQtSWDLLltQQctHLSBSWHlWgFwhMRsgwggrFJPgdgwwGJhJ
nCqmfVqfVjTznCMhsGRRRgGFMffw
mCnNTVzVvjmqNtlDtbttDlBM
LjctjtppFWmgthgs
nBrNvzTqlDJlbbZgvmhMZVZb
JJrnTrrgGDqDPwwSPHPpfjRdPc
sTQmCmmVqmJHSTjGdMMfMNNvNHvc
rFbzlLLWWPzwlWrlbwzrWbRvdfFjdjpvjfFNNMccphCvhN
rrWzrwzPBBBCZTJgZg
gffvjftWddzZtbvdNvgZLwBBMJLSWMDMDDBRWRmS
PqPqpqcCnCpVqlClTQQmPMDwPRJJBLLLhS
VCGqlHmmHsjtHNsZ
mmMlVllWmhmmBzzLGMWlBmpstptPRRZpPMFJSpRsFRFs
DgjnndQcNTCCCDNcdSRSdtZPfwfwJSJJ
gQjCQqQjHNnjDCgHNcZGZLhHzrLVLGzlrGmb
JfwfJpBgJSMphZqtqDDG
QcQrssrGCcMCVcMc
RnljPRnPjWbGRbjnjbvmSzwHfHgwfJHzdLFSwBFW
sBjbHCBCnjvsJCHBsbvwwJGfRNFFFfFGTcrVFffNHRTP
zDqdpqMgMtgzthgDtQmzGPTVSTVrVGTFSVFFqNRF
zDLdphmmLhMhDhQdlzgLLbjCnWswWWlrZJBswCJJZl
FMNrQFgrVwmrpJMwMTMPflbsHPTtlSbftSjCbC
zGnGnhnGzDqRLnZLHNHbbbHDlltNSjCl
nzddcRzzBnRRvRRhvnQFpmpgggJVcVmMQmgN
CCpMlhwwpJpdBlsdcjvtZDFrtmRqmDrsmv
gzVPbjSPfSPTTTPnWVSbbvDQZZDZrFWDvFDvmvQQmZ
LTbLTPgnTzLVPNNGnNTgVNPlGdHHCphMwHMwjMphlpjccl
rMMrqcrmJqJqmCsTPWWGGPzPlPPrGL
fnwqwwZwRnVlWWnzWBWlDP
jvVHvqfpJmhtHJtH
NLMVQjRNTJCTJtZTJc
DlGlGHvFHGDgcFCtfhCJFtZc
DBHGGGSDvGDPHWBGdBbSvgWDNVMjLLRnmNmjPLNPNcRQVnjj
tsGdTJdJtNllzjGRzm
HZvvDLLWqbBBMRMRNjVhHRmn
vZDCvqqgBDZZjbZDrWqBvpdpFpcdpCJcPTSJJtptpP
"""
