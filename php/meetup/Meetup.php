<?php

declare(strict_types=1);

function meetup_day(int $year, int $month, string $which, string $weekday): DateTimeImmutable
{
    $day = starting_day($year, $month, $which);
    $date = new DateTime("$year-$month-$day");

    while (ucfirst($date->format('l')) !== $weekday) {
        $date->modify('+1 day');
    }

    return DateTimeImmutable::createFromMutable($date);
}

function starting_day(int $year, int $month, string $week): int
{
    $last = new DateTime("$year-$month-01");
    $last->modify('last day of this month');

    switch ($week) {
        case "first": return 1;
        case "second": return 8;
        case "third": return 15;
        case "fourth": return 22;
        case "last": return (int) $last->format('d') - 6;
        case "teenth": return 13;
    }
}
?>
