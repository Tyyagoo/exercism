package Luhn;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<is_luhn_valid>;

sub is_luhn_valid ($number) {
    $number =~ s/\s+//g;
    if ($number !~ /^[0-9]{2,}$/) { return 0; }

    my @digits = reverse split('', $number);
    my $sum = 0;
    for my $index (0..$#digits) {
        my $n = $digits[$index] + 0;
        if ($index % 2 == 1) {
            $n *= 2;
            $n -= 9 if $n > 9;
        }
        $sum += $n;
    }
    return $sum % 10 == 0;
}

1;
