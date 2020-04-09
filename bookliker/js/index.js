const list = document.querySelector('#list')
const showDiv = document.querySelector('#show-panel')

const main = () => {
  fetchBooks()
  createClickListener()
  createLikeListener()
}

const createLikeListener = () => {
  showDiv.addEventListener('click', (event) => {
    if (event.target.matches('button')) {
      const id = event.target.dataset.id
      const myUser = {id:1, username:"pouros"}


      console.log(event.target.nextSibling.children)
      const userNodes = [...event.target.nextSibling.children];
      const existingUsers = userNodes.map(li => {
        return { id: li.dataset.userId, username: li.innerText}
      })

      console.log(existingUsers)




      const payload = {
        users: [
          ...existingUsers,
          myUser
        ]
      }





      const reqObj = {
        method: 'PATCH',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(payload)
      }

      fetch(`http://localhost:3000/books/${id}`, reqObj)
      .then(resp => resp.json())
      .then(book => {
        const li = document.createElement('li')
        li.innerText = myUser.username
        li.dataset.userId = myUser.id
        event.target.nextSibling.append(li)
      })
    }
  })

  // listen to the show Panel
  // for a click
  //      make sure it was the btn that got clicked
  //        recover the id of the book
  //        // create rewquest object
//          // assemble the list of users
  //       -> send a patch request
  //       // once succesful:
  //          // update the FE
  
}





const createClickListener = () => {
  list.addEventListener('click', (event) =>{
    const id = event.target.dataset.id
    fetch(`http://localhost:3000/books/${id}`)
    .then(resp => resp.json())
    .then(bookObj => {
      renderShowPage(bookObj)
    })
  })
}

const renderShowPage = (bookObj) => {
  showDiv.innerHTML = ''

  const header = document.createElement('h4')
  header.innerText = bookObj.title

  const image = document.createElement('img')
  image.src = bookObj.img_url

  const desc = document.createElement('p')
  desc.innerText = bookObj.description

  const ul= document.createElement('ul')

  bookObj.users.forEach(user =>{
    const li = document.createElement('li')
    li.innerText = user.username
    li.dataset.userId = user.id

    ul.append(li)
  })

  const likeButton = document.createElement('button')
  likeButton.dataset.id = bookObj.id
  likeButton.innerText = 'like'


  // likeButton.addEventListener('click', () => {
    // console.log(bookObj.users)


  // })

  showDiv.append(header, image, desc, likeButton, ul)

  const footer = '<h4>this book was publishedby penguin</h4>'
  showDiv.innerHTML += footer
}


const fetchBooks = () => {
  fetch('http://localhost:3000/books')
    .then(resp => resp.json())
    .then(books => {
      books.forEach(bookObj => {
        const listItem = `<li data-id=${bookObj.id} >${bookObj.title}</li>`
        list.innerHTML += listItem
      })
    })
}

main()
