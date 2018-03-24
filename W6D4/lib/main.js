
const DomNode = require("./dom_node_collection");

window.$l = (arg) => {

  if (arg instanceof HTMLElement) {
    return new DomNode([arg]);
  } else {
    let nodes = document.querySelectorAll(arg);
    let arr = [].slice.call(nodes);
    return new DomNode(arr);
  }

  // let first = arg[0];
  //
  // let nodes;
  // let result;
  // switch(first) {
  //   case "#":
  //       nodes = document.getElementById(arg.slice(1));
  //       break;
  //   case ".":
  //       nodes = document.getElementsByClassName(arg.slice(1));
  //       break;
  //   default:
  //       nodes = document.querySelectorAll(arg);
  // }
  // result = [].slice.call(nodes);
  // // return result;
  // return result.map( el => new domNode(el));
};
