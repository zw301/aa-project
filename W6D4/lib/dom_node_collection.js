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
