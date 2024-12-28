package KindergartenGarden;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<plants>;

sub plants ( $diagram, $student ) {
    my %plants = (
        C => 'clover',
        G => 'grass',
        R => 'radishes',
        V => 'violets',
    );

    my @rows = split(/\n/, $diagram);
    my @students = ("Alice", "Bob", "Charlie", "David", "Eve", "Fred", "Ginny", "Harriet", "Ileana", "Joseph", "Kincaid", "Larry");

    my $index = -1;
    for (my $i = 0; $i < @students; $i++) {
        if ($students[$i] eq $student) {
            $index = $i;
            last;
        }
    }

    my $pos = $index * 2;

    return [$plants{substr($rows[0], $pos, 1)}, 
            $plants{substr($rows[0], $pos + 1, 1)}, 
            $plants{substr($rows[1], $pos, 1)}, 
            $plants{substr($rows[1], $pos + 1, 1)}];
}

1;
