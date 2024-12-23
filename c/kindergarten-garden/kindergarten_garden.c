#include "kindergarten_garden.h"

#include <string.h>

plant_t char_to_plant(char chr) {
    switch (chr) {
    case 'G':
        return GRASS;
    case 'C':
        return CLOVER;
    case 'R':
        return RADISHES;
    case 'V':
        return VIOLETS;
    default:
        return 0;
    }
}

plants_t plants(const char * diagram, const char * student) {
    int n_students = 12;
    const char * students[] = {
        "Alice", "Bob", "Charlie", "David", "Eve", "Fred",
        "Ginny", "Harriet", "Ileana", "Joseph", "Kincaid",
        "Larry"
    };
    
    int idx_student = 0;
    for (; idx_student < n_students; ++idx_student) {
        if (strcmp(students[idx_student], student) == 0) {
            break;
        }
    }

    const char * secondrow = strchr(diagram, '\n');
    int pos = idx_student * 2;

    return (plants_t) {
        .plants = {
            char_to_plant(diagram[pos]),
            char_to_plant(diagram[pos + 1]),
            char_to_plant(secondrow[pos + 1]),
            char_to_plant(secondrow[pos + 2])
        }
    };
}