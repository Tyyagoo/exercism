pub fn expected_minutes_in_oven() {
  40
}

pub fn remaining_minutes_in_oven(time_in_oven) {
  expected_minutes_in_oven() - time_in_oven
}

pub fn preparation_time_in_minutes(layers) {
  layers * 2
}

pub fn total_time_in_minutes(layers, time_in_oven) {
  time_in_oven + preparation_time_in_minutes(layers)
}

pub fn alarm() {
  "Ding!"
}
