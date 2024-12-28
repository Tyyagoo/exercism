BEGIN {
    FPAT = "."
    for(n=0;n<256;n++)ord[sprintf("%c",n)]=n
}

{
    bitset = 0
    for (i = 1; i <= NF; i++) {
        pos = 0
        
        if ($i >= "A" && $i <= "Z") {
            pos = lshift(1, ord[$i] - ord["A"])
        }
        
        if ($i >= "a" && $i <= "z") {
            pos = lshift(1, ord[$i] - ord["a"])
        }

        if (and(bitset, pos) != 0) {
            print "false"
            exit
        }
        
        bitset = or(bitset, pos)
    }
    print "true"
}
