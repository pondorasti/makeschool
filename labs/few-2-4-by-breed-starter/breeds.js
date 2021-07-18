import * as data from './cat-and-dog-breeds.json'

const petTypes = []
for (let key in data) {
  petTypes.push(key)
}

const getBreeds = (name) => {
  const arr = []
  for (let key in data[name]) {
    const obj = data[name][key]
    obj.breed = key
    arr.push(obj)
  }
  return arr
}

const cats = getBreeds('cat_breeds')
const dogs = getBreeds('dog_breeds')

export { petTypes, cats, dogs }