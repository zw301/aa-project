// function sum(...nums) {
//   let total = 0;
//   for (let i = 0; i < nums.length; i++) {
//     total += nums[i];
//   }
//   return total;
// }
// console.log( sum(1, 2, 3, 4) === 10);
// console.log( sum(1, 2, 3, 4, 5) === 15);


//
// Function.prototype.myBind = function(ctx, ...bindTimeArgs) {
//   // console.log(arguments);
//   // arguments[0].this();
//   let that = this;
//   return function(...callTimeArgs) {
//     let args = bindTimeArgs.concat(callTimeArgs);
//     // console.log(result);
//     return that.call(ctx, ...args);
//     // return args;
//     // that.apply(result[0],result.slice(1));
//
//   };
//
//   // return fn;
//
//   // let args = Array.from(arguments);
//   // this.call(...args);
//
//   // this.call(...fn());
//
//   // console.log(this);
// };


//es5
// Function.prototype.myBind = function() {
//   let context = arguments[0];
//   let bindArgs = [].slice.call(arguments, 1);
//
//   let that = this;
//
//   return function() {
//     let callArgs = [].slice.call(arguments);
//     return that.apply(context, bindArgs.concat(callArgs));
//   };
// };

///es6
// Function.prototype.myBind = function(context, ...bindArgs) {
//   return (...callArgs) => {
//     return this.apply(context, bindArgs.concat(callArgs));
//   };
// };








//
// class Cat {
//   constructor(name) {
//     this.name = name;
//   }
//
//   says(sound, person) {
//     console.log(`${this.name} says ${sound} to ${person}!`);
//     return true;
//   }
// }
//
// const breakfast = new Cat("Breakfast");
// const markov = new Cat("Markov");
//
markov.says.myBind(breakfast, "hello", "ziyan")();
// markov.says.myBind(breakfast)("meow", "a tree");
// markov.says.myBind(breakfast, "meow")("Markov");
//
// const notMarkovSays = markov.says.myBind(breakfast);
// notMarkovSays("meow", "me");
//
// markov.says.myBind(breakfast)("meow", "me");

// markov.says("meow", "Ned");
// Markov says meow to Ned!
// true

// bind time args are "meow" and "Kush", no call time args
// markov.says.myBind(breakfast, "meow", "Kush")();
// Breakfast says meow to Kush!
// true


// class Dog
//
//   def self.call(arg)
//     puts arg
//     self
//   end
//
// end
//
// Dog("something")("something else")
//
//
// my_proc = Proc.new { puts "whatever" }
// my_proc.call
// my_proc()


function curry(count){
  let arr = [];
  function curriedSum(n) {
    arr.push(n);
    if(arr.length === count) {
      let sum = 0;
      for (var i = 0; i < arr.length; i++) {
        sum += arr[i];
      }
      return sum;
    }
    return curriedSum;
  }
  return curriedSum;
}


Function.prototype.curry1 = function(numArgs) {
  let arr = [];
  let fn = this;

  function curriedFun(n) {
    arr.push(n);

    if(arr.length === numArgs) {
      return fn(...arr);
    } else {
      return curriedFun;
    }
  }
  return curriedFun;
};


Function.prototype.curry2 = function(numArgs) {
  let arr = [];
  let fn = this;

  function curriedFun(n) {
    arr.push(n);

    if(arr.length === numArgs) {
      return fn.apply(null, arr);
    } else {
      return curriedFun;
    }
  }
  return curriedFun;
};


function sum(...args) {
  let total = 0;
  for(let i = 0; i < args.length; i++) {
    total += args[i];
  }

  return total;

}



let currySum1 = sum.curry1(2);

console.log(currySum1(19));
console.log(currySum1(12));

let currySum2 = sum.curry2(2);

console.log(currySum2(19));
console.log(currySum2(12));

// console.log(sum.curry(2)(3)(2));
