import Foundation

final class Solution20Tests: SolutionTests<Solution20> {
    override var exampleInput1: String {
        """
        broadcaster -> a, b, c
        %a -> b
        %b -> c
        %c -> inv
        &inv -> a
        """
    }
    override var exampleOutput1: String? { "32000000" }
    override var exampleOutput2: String? { "" }

    override var additionalTests: [AdditionalTest] {
        [
            .init(
                input: """
                broadcaster -> a
                %a -> inv, con
                &inv -> b
                %b -> con
                &con -> output
                """,
                output1: "11687500")
        ]
    }

    override var output1: String? { "" }
    override var output2: String? { "" }
    override var input: String {
        """
        %db -> cq
        %rj -> gp, nd
        %ff -> bk
        %rc -> gp
        %bk -> tv
        %xz -> tf, bn
        %gs -> bn
        %ps -> rs, gp
        %jr -> gp, cg
        &pm -> vf
        %pn -> pp, rt
        %nv -> jr
        %rs -> nv
        %kz -> mj
        %nd -> rc, gp
        %nm -> rt, db
        %dg -> rt, xl
        %vg -> gn
        %hc -> vr
        %ft -> lf, bn
        %mj -> hc, cz
        %vb -> ft
        %qd -> cz, sz
        %pp -> rt
        %cq -> rt, vg
        %sr -> vb
        %lf -> vx, bn
        %lh -> pn, rt
        %ls -> sl, cz
        %tv -> gp, rj
        %tf -> sr, bn
        &mk -> vf
        %bs -> rt, lh
        %vx -> bn, gs
        &bn -> fs, bv, vb, mk, sr, bz, cf
        %rr -> ls
        %bv -> xz
        %hp -> bs, rt
        &pk -> vf
        %cg -> rq
        %gn -> rt, dg
        &cz -> hc, kz, rr, hf, sh
        %sl -> cz, kz
        broadcaster -> sh, nm, ps, fs
        %cf -> bv
        &vf -> rx
        &rt -> pk, xl, nm, vg, db
        %xl -> hp
        %sh -> rr, cz
        %bz -> cf
        %fz -> dn, cz
        &gp -> rs, nv, pm, cg, ff, bk, ps
        %fs -> bz, bn
        &hf -> vf
        %vr -> cz, qd
        %rq -> gp, ff
        %sz -> cz, fz
        %dn -> cz
        """
    }
}
