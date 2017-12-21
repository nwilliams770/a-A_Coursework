let range = function (start,end) {
  if (start === end) {
    return [end];
  }

  return [start].concat(range(start + 1, end));
};

console.log(range(1, 8));

let sumRecc = function(arr) {
  if (arr.length === 0) {
    return 0;
  }
  let k = arr.length;
  return arr[0]+ sumRecc(arr.slice(1, k));
};


console.log(sumRecc([1,2,3,4]));
