function upvote(elem, id) {
  /* Handles the "upvote" action. Called when the user clicks on the upvote arrow. */
  const voteBox = elem.parentElement;
  const numVotesElem = voteBox.getElementsByClassName("numvotes")[0];
  if (voteBox.classList.contains("upvote")) {
      /* If post is already upvoted, undo the upvote */
      updateVotes(numVotesElem, -1)
      voteBox.classList.remove("upvote");
      fetch(`vote/none/${id}`, {method: 'POST'}).then((response) => {
        console.log("removed upvote, got status " + response.status);
      });
  } else {
      /* Otherwise, check if post has been downvoted before changing # votes */
      const isDownvoted = voteBox.classList.contains("downvote");
      updateVotes(numVotesElem, isDownvoted ? 2 : 1);
      voteBox.classList.remove("downvote");
      voteBox.classList.add("upvote");
      fetch(`vote/up/${id}`, {method: 'POST'}).then((response) => {
        console.log("added upvote, got status " + response.status);
      });
  }
}

function downvote(elem, id) {
  /* Handles the "downvote" action. Called when the user clicks on the downvote arrow. */
  const voteBox = elem.parentElement;
  const numVotesElem = voteBox.getElementsByClassName("numvotes")[0];
  if (voteBox.classList.contains("downvote")) {
    /* If post is already downvoted, undo the downvote */
    updateVotes(numVotesElem, 1);
    voteBox.classList.remove("downvote");
    
    /* 
     * TODO: Make a POST request using 'fetch()' to the 'vote/none' endpoint to
     * undo the downvote
     */

  } else {
    /* Otherwise, check if post has been upvoted before changing # votes */
    const isUpvoted = voteBox.classList.contains("upvote");
    updateVotes(numVotesElem, isUpvoted ? -2 : -1);
    voteBox.classList.remove("upvote");
    voteBox.classList.add("downvote");
    
    /*
     * TODO: Make a POST request using 'fetch()' to the 'vote/down' endpoint to 
     * add a downvote
     */
    
  }
}

function updateVotes(elem, num) {
  const numVotes = parseInt(elem.innerHTML);
  elem.innerHTML = numVotes + num;
}