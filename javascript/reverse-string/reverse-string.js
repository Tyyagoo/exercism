export const reverseString = (s) => {
  // 30% slower
  // return [...s].reduce((xs, x) => x + xs, "")
  const arr = new Array(s.length)
  for (let i = 0; i <= s.length / 2; i++) {
    arr[i] = s[s.length - i]
    arr[s.length - i] = s[i]
  }
  return arr.join('') 
};
