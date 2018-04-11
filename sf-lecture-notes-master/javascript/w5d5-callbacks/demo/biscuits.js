const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function teaAndBiscuits () {
  let first, second;

  const questionTwo = reader.question('Would you like some biscuits?', (res) => {
    second = res;
    console.log(`You replied ${res}.`);
    finalStatement();
    reader.close();
  });

  reader.question('Would you like some tea?', (res) => {
    first = res;
    console.log(`You replied ${res}.`);
    questionTwo();
    
  });

  const finalStatement = function () {
    const firstRes = (first === 'yes') ? 'do' : 'don\'t';
    const secondRes = (second === 'yes') ? 'do' : 'don\'t';
    console.log(`So you ${firstRes} want tea and you ${secondRes} want biscuits.`);
  }


 
  
}
teaAndBiscuits();