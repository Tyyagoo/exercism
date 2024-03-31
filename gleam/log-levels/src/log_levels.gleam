import gleam/string

pub fn message(log_line: String) -> String {
  let assert [_, msg] = string.split(log_line, on: ":")
  string.trim(msg)
}

pub fn log_level(log_line: String) -> String {
  let assert ["[" <> lvl, _, ..] = string.split(log_line, on: "]")
  string.lowercase(lvl)
}

pub fn reformat(log_line: String) -> String {
  message(log_line) <> " (" <> log_level(log_line) <> ")"
}
