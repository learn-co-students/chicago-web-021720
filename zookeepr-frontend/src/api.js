// Connect to the Rails API and handle responses

const BASE_URL = "http://localhost:3000/animals"

fetch(BASE_URL)
.then(res => res.json())
.then(animals => console.log(animals))

let animalInfo = { 
  name: "Kong",
  gender: "Male",
  species: "Ape" 
}

fetch(BASE_URL, {
  method: 'POST',
  headers: {
    'Content-Type': "application/json"
  },
  body: JSON.stringify(animalInfo)
})
.then(res => res.json())
.then(output => console.log(output))