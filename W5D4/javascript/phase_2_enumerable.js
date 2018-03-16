Array.prototype.myEach = function(callback) {
  for (let i = 0; i < this.length; i++) {
    callback(this[i]);
  }
  return this;
};

let arr = [1,2,3];
// const cb = function(num) {
//   return num * num;
// };

arr.myEach((num) => {
  return num * num;
});

// console.log(arr.myEach(cb));


////////////////////////

Array.prototype.myMap = function(callback) {
  let result = [];
  for (var i = 0; i < this.length; i++) {
    result.push(callback(this[i]));
  }
  return result;
};

// function timesTwo(num) {
//   return num * 2;
// }
//
//
// console.log([3,4,5].myMap(timesTwo));

const res = [3,4,5].myMap(function(num) {
  return num * 2;
});

// console.log(res);

// Array.prototype.myReduce = function(callback[, acc]) {
//   let i = 0;
//   if(acc === undefined) {
//     i += 1;
//     acc = this[0];
//   }
//
//   while(i < this.length) {
//     callback(acc, el);
//     i += 1;
//   }
//
//   return acc;
// };

let callb = function(acc, el) {
  acc += el;
  return acc;
};

Array.prototype.myReduce = function(callback, acc) {
  let i = 0;

  if (!acc) {
    acc = this[0];
  }

  while(i < this.length) {
    acc = callback(acc, this[i]);
    i += 1;
  }

  return acc;
};

// Array.prototype.myReduce = function(callback, initValue) {
//   let array = this;
//
//   if (!initValue) {
//     initValue = array[0];
//     array = array.slice(1);
//   }
//
//   let result = initValue;
//
//   // array.myEach(el => result = callback(result, el));
//
//   array.myEach(function(el){
//      result = callback(result, el);
//      return result;
//   });
//   return result;
// };

// console.log([1,2,3].myReduce((total, item) => total + item ));
// console.log([1,2,3].myReduce(function(acc, el) {
//   return acc + el;
// },25));
