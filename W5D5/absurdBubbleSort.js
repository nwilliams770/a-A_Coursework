const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});


function askIfGreaterThan (el1, el2, callback) {
  reader.question(`Is ${el1} greater than ${el2}?`, function (answer) {
    if (answer === "yes") {
      callback (true);
    }
    else {
      callback (false);
    }
  });
}

function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {
  if (i < arr.length - 1) {
    askIfGreaterThan (arr[i], arr[i + 1], function (isGreaterThan) {
      if (isGreaterThan === true) {
        [arr[i], arr[i+1]] = [arr[i+1], arr[i]];
        madeAnySwaps = true;
      }

      innerBubbleSortLoop(arr, i + 1, madeAnySwaps, outerBubbleSortLoop);
    });
  }

  if (i === (arr.length - 1)) {
    outerBubbleSortLoop (madeAnySwaps);
  }
}



function absurdBubbleSort (arr, sortCompletedCallback) {
  function outerBubbleSortLoop (madeAnySwaps) {
    if (madeAnySwaps === true) {
      innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop);
    }

    if (madeAnySwaps === false) {
      sortCompletedCallback (arr);
    }
  }
  outerBubbleSortLoop (true);
}

absurdBubbleSort([3, 2, 1], function (arr) {
  console.log("Sorted array: " + JSON.stringify(arr));
  reader.close();
});
