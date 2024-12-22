BEGIN {
    FPAT = "[0-9]"
}
{
    sum = 0
    for (i = 1; i <= NF; i++) {
        d = $(NF - i + 1)
        sum += (i % 2 == 0) ? (d > 4 ? d * 2 - 9 : d * 2) : d
    }
    print (!/[^0-9 ]/ && sum % 10 == 0 && NF > 1) ? "true" : "false"
}
