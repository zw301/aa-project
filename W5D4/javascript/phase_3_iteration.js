Array.prototype.bubbleSort = function() {
  let sorted = this;

  for (let i = 0; i < sorted.length; i++) {
    for (let j = 0; j < sorted.length - 1 - i; j++) {
      if(sorted[j] > sorted[j + 1]) {
        let tmp = sorted[j];
        sorted[j] = sorted[j + 1];
        sorted[j + 1] = tmp;
      }
    }
  }

  return sorted;
};

// console.log([78,2,90,1,304,3].bubbleSort());

String.prototype.subStrings = function() {
  let result = [];

  let letters = this.split("");
  for (let i = 0; i < letters.length; i++) {
    for (let j = i + 1 ; j <= letters.length; j++) {
      let sub = letters.slice(i,j);
      result.push(sub.join(""));
    }
  }
  return result;
};

// console.log("cat".subStrings());
