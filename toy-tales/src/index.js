const addBtn = document.querySelector('#new-toy-btn')
const toyContainer = document.querySelector('#toy-collection')
const toyForm = document.querySelector('.container')
let addToy = false

function toggleForm(){
  addBtn.addEventListener('click', () => {
    addToy = !addToy
    toyForm.style.display = addToy ? 'block' : 'none';
  })
}


function fetchToys(){
  fetch('http://localhost:3000/toys')
    .then(resp => resp.json())
    .then(toys => {
      toys.forEach(renderToy)
    })
}

function createFormListener() {
  const form = document.querySelector('form')
  form.addEventListener('submit', event => {
    event.preventDefault()
    const formData = {
      name: event.target[0].value,
      image: event.target[1].value,
      likes: 0
    }
    form.reset()

    const reqObj = {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(formData)
    }


    fetch('http://localhost:3000/toys', reqObj)
      .then(resp => resp.json())
      .then(renderToy)
  })
}

function renderToy(toyObj) {
    const toyCard = `<div class="card"><h2>${toyObj.name}</h2><img src=${toyObj.image} class="toy-avatar" /><p>${toyObj.likes} Likes </p><button data-id=${toyObj.id} class="like-btn">Like <3</button></div>`
    toyContainer.innerHTML += toyCard
}

  // xgrab the form
  // xadd the event listener for the form (submit)
  // xignore natural tendencies of a form
  // x scrape the data off of the form and assemble it
  // use fetch to send a post req
  // update the front end to render the newly created toy


function createLikeListener(){
  toyContainer.addEventListener('click', event => {
    if (event.target.className === 'like-btn') {
      const likes = event.target.previousSibling.innerText.split(' ')[0]
      const id = event.target.dataset.id

      const reqObj = {
        method: 'PATCH',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({ likes: parseInt(likes) + 1})
      }

      fetch(`http://localhost:3000/toys/${id}`, reqObj)
      .then(resp => resp.json())
      .then(toyObj => {
        event.target.previousSibling.innerText = `${toyObj.likes} Likes`
      })
    }
  })

}

  // first find the div that holds all of the like btns
  // add an event listener to that div (click)
  // determine if the node that got clicked was the like btn
  // if it was the like btn:
  //    update backend
  //      grab the new like count
  //      grab the id of the toy
  //      send a patch fetch with the above data
  //
  //    update frontend
  //        grab the ptag and
  //        update the like count inside of it

function main() {
  toggleForm()
  fetchToys()
  createFormListener()
  createLikeListener()
}

main()









  // send a fetch request   to /toys
  // extract the json
  //   iterate over the array 
  //     and then render a dir (or Card) for each toy Object
        // #innerHTML // allows you to add html thats written as a string
        // const toyCard = document.createElement('div')
        // #append || #appendChild // allows you to add html Node Objects to the DOM


