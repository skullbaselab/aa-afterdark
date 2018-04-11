const storeNumberFact = (event) => {
  const response = event.currentTarget;
  if (response.status === 200) {
    const numberFact = document.getElementById('number-fact');
    numberFact.innerHTML = response.responseText;
  } else {
    console.log('Error getting the number fact');
  }
}

const getNumberFact = () => {
  const req = new XMLHttpRequest();
  req.open('GET', 'http://numbersapi.com/random/trivia', true);
  req.onreadystatechange = storeNumberFact;
  req.send();
};

const renderFeedback = (answerIsCorrect) => {
  const correctFeedback = document.getElementById('correct-answer');
  const wrongFeedback = document.getElementById('wrong-answer');
  if (answerIsCorrect) {
    correctFeedback.style.display = "block";
    wrongFeedback.style.display = "none";
  } else {
    correctFeedback.style.display = "none";
    wrongFeedback.style.display = "block";
    setTimeout(() => {
      wrongFeedback.style.display = "none";
    }, 2000);
  }
};

export { renderFeedback, getNumberFact };
