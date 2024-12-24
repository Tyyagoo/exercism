namespace eval dnd {
    namespace export character ability modifier
    namespace ensemble create

    proc modifier {score} {
        return [expr {int(floor(($score - 10) / 2.0))}]
    }

    proc ability {} {
        return [expr {int(rand() * 15) + 3}]
    }

    proc character {} {
        set char [dict create]
        set constitution_score [ability]
        dict set char strength [ability]
        dict set char dexterity [ability]
        dict set char intelligence [ability]
        dict set char wisdom [ability]
        dict set char charisma [ability]
        dict set char constitution $constitution_score
        dict set char hitpoints [expr {10 + [modifier $constitution_score]}]
        
        return $char
    }
}
