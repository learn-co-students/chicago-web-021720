document.addEventListener("DOMContentLoaded", function(event){
  const form = document.getElementById("comment-form");
  form.addEventListener("submit", handleCommentSubmit);
  
  const parent = document.getElementById("helicopter-parent");
  parent.addEventListener("click", function(event){
    const name = event.target.dataset.name
    if (name === "error") {
      console.error("MADE A OOPS");
    } else if (name === "alert") {
      alert("LERT!");
    } else if (name === "log") {
      console.log("Alone or in pairs!");
    }
  });

  const alertButton = document.getElementById("alert-btn");
  alertButton.addEventListener("click", doAnAlert);

  const list = document.getElementById("comments-container");
  list.addEventListener("click", function(event){
    if(event.target.tagName === "P") {
      doAnAlert();
    }
  });
  // const paragraphTags = document.getElementsByTagName("p")
  // for (let i = 0; i < paragraphTags.length; i++) {
  //   paragraphTags[i].addEventListener("click", doAnAlert);
    
  // }
  // paragraphTags.forEach(function(parTag){
  //   parTag.addEventListener("click", doAnAlert)
  // })
})

function handleCommentSubmit(event) {
  const commentInput = event.target[0];
  event.preventDefault();
  prependCommentToList(commentInput.value);
  commentInput.value = "";
}

function prependCommentToList(commentText) {
  const newCommentNode = document.createTextNode(commentText);
  let pTag = document.createElement("p");
  pTag.appendChild(newCommentNode);
  const container = document.getElementById("comments-container");
  container.prepend(pTag);
}

function doAnAlert() {
  alert("YES MY DEAR!?!?!?!");
}


console.log("hello world!");