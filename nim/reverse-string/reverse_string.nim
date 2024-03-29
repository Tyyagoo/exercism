proc reverse*(s: string): string =
  for i in countdown(s.len - 1, 0): result.add s[i]
