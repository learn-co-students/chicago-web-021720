const BASE_URL = "http://localhost:3000"
const TRAINERS_URL = `${BASE_URL}/trainers`
const POKEMONS_URL = `${BASE_URL}/pokemons/`

const main = document.querySelector('main')




const fetchTrainers = () => {
  fetch(TRAINERS_URL)
    .then(resp => resp.json())
    .then(trainers => {
      trainers.forEach(trainer => {
        const pokemonLis = trainer.pokemon.map(pokeObj => {
          return `<li>${pokeObj.nickname} (${pokeObj.species}) <button class="release" data-pokemon-id=${pokeObj.id}>Release</button></li>`
        }).join('')

        const trainerCard = `<div class="card" data-id=${trainer.id}><p>${trainer.name}</p><button class="addPoke" data-trainer-id=${trainer.id}>Add Pokemon</button><ul>${pokemonLis}</ul></div>`
        main.innerHTML += trainerCard
      })

    })
}

const addMainListener = () => {
  main.addEventListener('click', (event) => {
    const ul = event.target.nextSibling
    if(event.target.className === 'addPoke' && ul.children.length < 6) {
      const id = event.target.dataset.trainerId
      const reqObj = {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        }, 
        body: JSON.stringify({ trainer_id: id})
      }

      fetch(POKEMONS_URL, reqObj)
        .then(resp => resp.json())
        .then(pokeObj => {
          const ul = event.target.nextSibling
          const pokeLi = `<li>${pokeObj.nickname} (${pokeObj.species}) <button class="release" data-pokemon-id=${pokeObj.id}>Release</button></li>`
          ul.innerHTML += pokeLi
        })
    } else if (event.target.className === 'release') {
      const pokeId = event.target.dataset.pokemonId

      fetch(POKEMONS_URL + pokeId, { method: "DELETE"})
      .then(resp => resp.json())
      .then(data => {
        event.target.parentNode.remove()
      })
      // grab the id of the pokemon about to be deleted
      // make a delete request fetch
      //  remove the li node

    }
  })
}



const start = () => {
  fetchTrainers()
  addMainListener()
}


start()


