# These variables are initialized on the command line (using '-v'):
# - name

BEGIN {
    split("Alice Bob Charlie David Eve Fred Ginny Harriet Ileana Joseph Kincaid Larry", students)
    for (i in students) {
        if (students[i] == name) {
            pos = (i - 1) * 2 + 1
            break
        }
    }
}

{
    rows[NR] = $0
}

END {
    plant_map["G"] = "grass"
    plant_map["C"] = "clover"
    plant_map["R"] = "radishes"
    plant_map["V"] = "violets"
    
    a = plant_map[substr(rows[1], pos, 1)]
    b = plant_map[substr(rows[1], pos + 1, 1)]
    c = plant_map[substr(rows[2], pos, 1)]
    d = plant_map[substr(rows[2], pos + 1, 1)]
    printf "%s %s %s %s", a, b, c, d
}