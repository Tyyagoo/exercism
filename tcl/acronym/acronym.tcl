proc abbreviate {phrase} {
    set pattern {^[A-Z]|[a-z][A-Z]|[\s\-_,][A-Za-z]}
    set result [join [regexp -all -inline $pattern $phrase] ""]
    
    regsub -all {[\s\-_,]} $result "" result
    set result [string toupper $result]
    return $result
}