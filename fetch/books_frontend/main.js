
function main() {
  fetchBooks()
  createFormListener()
}


function createFormListener(){
  const form = document.querySelector('form')
  form.addEventListener('submit', function(event){
    event.preventDefault()
    console.log(event.target) //form
    console.log(event.target[0].value) // first input field
    console.log(event.target[1].value) // second input field

    const formData = {
      title: event.target[0].value,
      author: event.target[1].value
    }


    const reqObj = {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(formData)
    }


    fetch('http://localhost:3000/books', reqObj)
      .then(resp => resp.json())
      .then(renderBook)

  })
}

function renderBook(book){
  const bookDiv = document.getElementById('book-list')
  bookDiv.innerHTML += `<p>${book.title} - ${book.author}</p>`





  // another way to add elements: 
  //
        // add books by creating nodes and appending them
        // const p = document.createElement('p')
        // p.innerText = `${book.title} - ${book.author}`
        // bookDiv.append(p)
}


function fetchBooks() {
  fetch('http://localhost:3000/books')
    .then(resp => resp.json())
    .then(books => {
      books.forEach(renderBook)
    })

  // make a network request to grab the books arr from BE
  // iterate over the array
  //   for each element create some html elements related to that particular book
}



main()
