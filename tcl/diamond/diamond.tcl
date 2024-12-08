proc ord {c} {scan $c %c}
proc chr {b} {format %c $b}

proc inner_gap {byte} {
    return [expr {$byte == 65 ? 0 : ($byte - 65) * 2 - 1}]
}

proc row {byte len} {
    set char [chr $byte]
    set gap [inner_gap $byte]
    set side [string repeat " " [expr {($len - $gap - 1) / 2}]]
    if {$byte == 65} {
        return "$side$char$side"
    } else {
        set middle [string repeat " " $gap]
        return "$side$char$middle$char$side"
    }
}

proc diamond {letter} {
    set byte [ord $letter]
    set len [expr {($byte - 65) * 2 + 1}]
    set result [row 65 $len]

    for {set i 66} {$i <= $byte} {incr i} {
        append result "\n[row $i $len]"
    }

    for {set i [expr {$byte - 1}]} {$i >= 65} {incr i -1} {
        append result "\n[row $i $len]"
    }

    return $result
}
