function range(start, end) {
  if (start === end) {
    return [start];
  }

  let pre = range(start, end - 1);
  // return range(start, end - 1).push(end);
  pre.push(end);
  return pre;
}

// console.log(range(1,10));


function sumRec(arr) {
  if(arr.length === 1) {
    return arr[0];
  }
  // let sum = arr[0] + sumRec(arr.slice(1));

  return arr[0] + sumRec(arr.slice(1));
}

// console.log(sumRec([1,5,9,3,4]));

function exponent(base, exp) {
  if(exp === 0 ) {
    return 1;
  }

  return base * exponent(base, exp - 1);
}

// console.log(exponent2(2,3));

function exponent2(base, exp) {
  if( exp === 0) {
    return 1;
  }

  if (exp % 2 === 0) {
    return exponent2(base, exp/2) ** 2;
  } else {
    return base * (exponent2(base, (exp-1)/2) ** 2);
  }
}


function fibonacci(n) {
    if (n === 1) {
      return [1];
    } else if (n === 2) {
      return [1,1];
    }

    let pre = fibonacci(n-1);
    let last = pre[pre.length - 1] + pre[pre.length - 2];
    pre.push(last);
    return pre;
}

// console.log(fibonacci(5));

function deepDup(arr) {
  let newArr = [];

  for (let i = 0; i < arr.length; i++) {
    // return (Array.isArray(arr[i]) ? deepDup(arr[i]) : arr[i] )

    if (!Array.isArray(arr[i])) {
      newArr.push(arr[i]);
    }
    else {
      newArr.push(deepDup(arr[i]));
    }
  }

  return newArr;

}

// a1 = [1,[5,6],3];
// a3 = a1;
//
// a2 = deepDup(a1);
//
// a1[1] = 9;
//
// console.log(a1);
// console.log(a2);
// console.log(a3);

function bsearch(arr, target) {
  let mid = Math.floor(arr.length / 2);

  // console.log(mid);

  if (arr.length === 0) {
    return -1;
  }

  if (target === arr[mid]) {
    return mid;
  } else if (target < arr[mid]) {
    return bsearch(arr.slice(0, mid), target);
  } else {
    pre = bsearch(arr.slice(mid + 1), target)
    if (pre === -1){
      return -1;
    }else{
      return bsearch(arr.slice(mid), target) + mid + 1;
    }
  }
};
console.log(bsearch([1,2,3,4,7,8,9], 7));
console.log(bsearch([6,7,8,9], 7));
console.log(bsearch([6,7,8,9], 10));

function mergeSort(arr) {
  if (arr.length === 1){
    return arr;
  }
  let mid = Math.floor(arr.length / 2);
  let left = [];
  let right = [];
  for (var i = 0; i < arr.length; i++) {
    if (arr[i] < arr[mid]) {
      left.push(arr[i]);
    } else {
      right.push(arr[i]);
    }
  }
  let sorted_left = mergeSort(left);
  let sorted_right = mergeSort(right);
  let result = merge(sorted_left, sorted_right);

  return result;
}

function merge(left, right) {

  let result = [];

  while(left.length > 0 && right.length > 0) {
    if (left[0] >= right[0]) {
      result.push(right.shift());
    } else {
      result.push(left.shift());
    }
  }

  return result.concat(left).concat(right);
}

console.log(mergeSort([1,8,9,2,5,7]));
