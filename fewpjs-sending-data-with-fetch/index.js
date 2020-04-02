// Add your code here
// fetch("http://localhost:3000/dogs")
// .then(function(response) {
//   console.log(response)
//   return response.json()
// }).then(function(dogs){
//   console.log(dogs)
// })

// fetch("http://localhost:3000/robots")
// .then(function(response) {
//   console.log(response)
//   return response.json()
// }).then(function(robots){
//   console.log(robots)
// })


// fetch("http://localhost:3000/robots/9002", {
//   method: "DELETE"
// })
// .then(function (response) {
//   console.log(response)
//   return response.json()
// }).then(function (robots) {
//   console.log(robots)
// })


function postADog(someName, someBreed) {
  let dogData = {
    dogName: someName,
    dogBreed: someBreed,
  }

  fetch("http://localhost:3000/dogs", {
    method: "POST",
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(dogData)
  }).then(function(response){
    if(response.status == 201) {
      alert("WOOF! I exist! You Rock!")
    }
    return response.json()
  })

}

// let name = "Fido"
// let breed = "Chihuahua"

// postADog(name, breed)
// fetch("http://localhost:3000/dogs/1", {
  //   method: 'PATCH',
  //   headers: {
    //     'Content-Type': 'application/json'
    //   },
    //   body: JSON.stringify(dogData)
    // })
    // .then(function (response) {
      //   console.log(response)
      //   return response.json()
      // }).then(function (dog) {
        //   console.log("Dog?", dog)
        // })

form = document.getElementById("dog-form")
form.addEventListener("submit", function(event){
  event.preventDefault()
  let name = this.elements["name"].value
  let breed = this.elements["breed"].value
  if(name !== "" && breed !== "") {
    postADog(name, breed)
  } else {
    alert("Please enter a name and a breed before making me real, Dwayne.")
  }
})