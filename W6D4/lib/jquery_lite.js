/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {


const DomNode = __webpack_require__(1);

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


/***/ }),
/* 1 */
/***/ (function(module, exports) {

class DOMNodeCollection {
  // It should receive an array of HTMLElements as its only argument.
  // Store this array as an instance variable.
  constructor(nodes) {
    this.nodes = nodes;
  }

  // The core function should return an instance of DOMNodeCollection.

  html(str) {
    if(str === undefined) {
      return this.nodes[0].innerHTML;
    } else {
      this.nodes.map(el => {
        el.innerHTML = str;
      });
      return this.nodes;
    }
  }
  empty() {
    this.html("");
    return this.nodes;
  }
  append(arg) {
    if (this.nodes.length === 0) return;

    if(typeof(arg) === "string") {
      this.nodes.forEach( el => {
        // el.appendChild(arg);
        el.innerHTML += arg;
      });
    } else if(arg instanceof HTMLElement) {
      this.nodes.forEach( el => {
        let tmp = arg.cloneNode(true);
        el.appendChild(tmp);
      });
    } else {
      this.nodes.forEach( el => {
        arg.nodes.forEach( node => {
          let tmp = node.cloneNode(true);
          el.appendChild(tmp);
        });
      });
    }

  }

  attr(key, value) {
    if(value !== undefined) {
      this.nodes.forEach(el => {
        el.setAttribute(key, value);
      });
    } else {
      return this.nodes[0].getAttribute(key);
    }
  }

  addClass(classname) {
    if (this.nodes.length === 0) return;
    this.nodes.forEach( node => {
      node.classList.add(classname);
    });
  }
  removeClass(classname) {
    if (this.nodes.length === 0) return;
    this.nodes.forEach( node => {
      node.classList.remove(classname);
    });
  }


  find(selector) {
    let result = [];
    this.nodes.forEach(node => {

      let tmp = node.querySelectorAll(selector);
      let arr = [].slice.call(tmp);
      result = result.concat(arr);
    });
    return new DOMNodeCollection(result);
  }

  remove() {
    this.nodes.forEach(node => {
      node.outerHTML = "";
    });
  }

  on(eventname, callback) {
    this.nodes.forEach(node => {
      node.addEventListener(eventname, callback);
      const eventKey = `jqliteEvents-${eventname}`;
      if (typeof node[eventKey] === "undefined") {
         node[eventKey] = [];
       }
       node[eventKey].push(callback);
      });
  }
  off(eventname) {}

}

module.exports = DOMNodeCollection;


/***/ })
/******/ ]);