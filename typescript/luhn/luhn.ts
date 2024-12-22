export function valid(digitString: string): boolean {
  digitString = digitString.replace(/\s/g, '')
  if (!digitString.match(/^[0-9]{2,}$/)) return false
  digitString = `${digitString.length % 2 == 0 ? '' : '0'}${digitString}`

  let sum = 0
  for (let i = 0; i < digitString.length; i++) {
    const digit = parseInt(digitString[i])
    if (i % 2 == 0) sum += digit > 4 ? (digit * 2 - 9) : digit * 2
    else sum += digit
  }
  
  return sum % 10 == 0
}
