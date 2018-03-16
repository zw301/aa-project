Array.prototype.uniq = function() {
  let result = [];


  for (let i = 0; i < this.length; i++) {
    if (!result.includes(this[i])) {
      result.push(this[i]);
    }
  }
  return result;
};

// console.log([1,1,2,3].uniq());

Array.prototype.twoSum = function() {
  let result = [];
  for (let i = 0; i < this.length; i++) {
    for (let j = i + 1; j < this.length; j++) {
      if (this[i] + this[j] === 0) {
        result.push([i,j]);
      }
    }
  }
  return result;
};

// console.log([1,6,7,8,2,-6,-7].twoSum());

Array.prototype.transpose = function() {
  let result = [];

  for (let i = 0; i < this[0].length; i++) {
    let temp = [];
    for (let j = 0; j < this.length; j++) {
      temp.push(this[j][i]);
    }
    result.push(temp);
  }
  return result;
};

// console.log([[1,2,3],[4,5,6]].transpose());
