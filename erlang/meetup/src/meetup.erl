-module(meetup).

-export([meetup/4]).

meetup(Year, Month, DayOfWeek, Week) ->
    FirstDay = week_first_day(Week, Year, Month),
    find_date(Year, Month, weekday(DayOfWeek), FirstDay).

week_first_day(first, _, _) -> 1;
week_first_day(second, _, _) -> 8;
week_first_day(third, _, _) -> 15;
week_first_day(fourth, _, _) -> 22;
week_first_day(teenth, _, _) -> 13;
week_first_day(last, Year, Month) ->
    calendar:last_day_of_the_month(Year, Month) - 6.

weekday(monday) -> 1;
weekday(tuesday) -> 2;
weekday(wednesday) -> 3;
weekday(thursday) -> 4;
weekday(friday) -> 5;
weekday(saturday) -> 6;
weekday(sunday) -> 7.

find_date(Year, Month, DayOfWeek, Day) ->
    case calendar:day_of_the_week(Year, Month, Day) of
        DayOfWeek -> {Year, Month, Day};
        _ -> find_date(Year, Month, DayOfWeek, Day + 1)
    end.
