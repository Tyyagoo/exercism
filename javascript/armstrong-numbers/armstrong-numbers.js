export const isArmstrongNumber = (n) => {
  n = n.toString()
  let sum = 0
  
  for (const digit of n) {
    sum += Math.pow(parseInt(digit), n.length)
  }

  return sum == n
};
