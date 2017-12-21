const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function addNumbers (sum, numsLeft, completionCallback) {

  if (numsLeft > 0){
    reader.question("Enter a number: ", function (numString) {
      // if (numsLeft === 0) {
      //   return sum;
      // }
      let num = parseInt(numString);
      sum += num;
      console.log(`Partial Sum: ${sum}`);
      addNumbers(sum, (numsLeft - 1), completionCallback);
    });
  } else {
      completionCallback(sum);
      reader.close();
    }
}


addNumbers(0, 8, sum => console.log(`Total Sum: ${sum}`));
