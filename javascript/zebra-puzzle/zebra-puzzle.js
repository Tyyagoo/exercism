const COLORS = Object.freeze(['Red', 'Green', 'Ivory', 'Yellow', 'Blue'])
const NATIONS = Object.freeze(['Englishman', 'Japanese', 'Ukrainian', 'Spaniard', 'Norwegian'])
const PETS = Object.freeze(['Dog', 'Zebra', 'Snail', 'Fox', 'Horse'])
const DRINKS = Object.freeze(['Milk', 'Water', 'Coffee', 'Tea', 'Orange Juice'])
const HOBBIES = Object.freeze(['Chess', 'Dancing', 'Reading', 'Painting', 'Football'])

export class ZebraPuzzle {
  constructor() {
    this.houses = new Array(5).fill(null)
    
    const getPermutations = (arr) => {
      if (arr.length <= 1) return [arr]
      const permutations = []
      for (let i = 0; i < arr.length; i++) {
          const currentElement = arr[i]
          const remainingElements = arr.slice(0, i).concat(arr.slice(i + 1))
          const remainingPermutations = getPermutations(remainingElements)
          remainingPermutations.forEach(perm => permutations.push([currentElement].concat(perm)))
      }
      return permutations
    }

    for (const nations of getPermutations(NATIONS)) {
      if (nations[0] != 'Norwegian') continue
      
      for (const drinks of getPermutations(DRINKS)) {
        if (drinks[2] != 'Milk') continue
        if (nations.indexOf('Ukrainian') != drinks.indexOf('Tea')) continue
        
        for (const colors of getPermutations(COLORS)) {
          if (nations.indexOf('Englishman') != colors.indexOf('Red')) continue
          if (drinks.indexOf('Coffee') != colors.indexOf('Green')) continue
          if (colors.indexOf('Ivory') + 1 != colors.indexOf('Green')) continue
          if (Math.abs(colors.indexOf('Blue') - nations.indexOf('Norwegian')) != 1) continue
          
          for (const hobbies of getPermutations(HOBBIES)) {
            if (colors.indexOf('Yellow') != hobbies.indexOf('Painting')) continue
            if (drinks.indexOf('Orange Juice') != hobbies.indexOf('Football')) continue
            if (nations.indexOf('Japanese') != hobbies.indexOf('Chess')) continue
            
            for (const pets of getPermutations(PETS)) {
              if (nations.indexOf('Spaniard') != pets.indexOf('Dog')) continue
              if (hobbies.indexOf('Dancing') != pets.indexOf('Snail')) continue
              if (Math.abs(hobbies.indexOf('Reading') - pets.indexOf('Fox')) != 1) continue
              if (Math.abs(hobbies.indexOf('Painting') - pets.indexOf('Horse')) != 1) continue

              for (let i = 0; i < 5; i++) {
                this.houses[i] = {
                  owner: nations[i],
                  drinks: drinks[i],
                  color: colors[i],
                  hobby: hobbies[i],
                  pet: pets[i]
                }
              }
            }
          }
        }
      }
    }
  }

  waterDrinker() {
    return this.houses.find(h => h.drinks == 'Water').owner
  }

  zebraOwner() {
    return this.houses.find(h => h.pet == 'Zebra').owner
  }
}
