module Meetup
  ( meetup
  , Week(..)
  ) where

import Prelude
import Data.Date (Date, Month, Weekday, Year, lastDayOfMonth, canonicalDate, weekday)
import Data.Maybe (Maybe(..))
import Data.Enum (fromEnum, toEnum)

data Week
  = First
  | Second
  | Third
  | Fourth
  | Last
  | Teenth

meetup :: Year -> Month -> Week -> Weekday -> Maybe Date
meetup year month which weekday =
  find_date year month weekday (first_day which year month)

first_day :: Week -> Year -> Month -> Int
first_day First  _ _ = 1
first_day Second _ _ = 8
first_day Third  _ _ = 15
first_day Fourth _ _ = 22
first_day Teenth _ _ = 13
first_day Last year month = (fromEnum (lastDayOfMonth year month)) - 6

find_date :: Year -> Month -> Weekday -> Int -> Maybe Date
find_date year month wd day =
  let
    maybeDay = toEnum day
    maybeDate = canonicalDate year month <$> maybeDay
    maybeWeekday = weekday <$> maybeDate
  in
    case maybeWeekday of
      Just wd' | wd' == wd -> maybeDate
      Just _               -> find_date year month wd (day + 1)
      _                    -> Nothing