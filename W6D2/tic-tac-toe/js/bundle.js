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
/******/ 	return __webpack_require__(__webpack_require__.s = 1);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports) {


const MoveError = function (msg) { this.msg = msg; };

// MoveError really should be a child class of the built in Error object provided
// by Javascript, but since we haven't covered inheritance yet, we'll just
// let it be a vanilla Object for now!

module.exports = MoveError;


/***/ }),
/* 1 */
/***/ (function(module, exports, __webpack_require__) {

const View = __webpack_require__(2); // require appropriate file
const Game = __webpack_require__(3); // require appropriate file

$( () => {
  // Your code here
  const rootEl = $('.ttt');
  const game = new Game();
  new View(game, rootEl);
});


/***/ }),
/* 2 */
/***/ (function(module, exports) {

class View {
  constructor(game, $el) {
    this.game = game;
    this.el = $el;
    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    // const $li = $('li');
    //
    // $li.on('click', (event) => {
    //   const $square = $(event.currentPlayer);
    //   this.makeMove($square);
    //
    // });
  }



  makeMove($square) {
    // const pos = $square.data('pos');
    const map = {
      square0 : [0, 0],
      square1 : [0, 1],
      square2 : [0, 2],
      square3 : [1, 0],
      square4 : [1, 1],
      square5 : [1, 2],
      square6 : [2, 0],
      square7 : [2, 1],
      square8 : [2, 2]
    };

    let id = $square.id;
    let pos = map[id];
    this.game.playMove(pos);
    let symobl = this.game.board.grid[pos[0]][pos[1]];

    // $square.text(symobl);
    $square.innerText = symobl;
    $square.style = "background-color: #fff";
    $($square).addClass(`${symobl}`);

    if (this.game.isOver()) {
      if (this.game.winner()) {
        let winner = this.game.winner();
        let $win = `<figcaption class='message'>You win, ${winner}!</figcaption>`;

        $($square).parent().parent().append($win);
        $($square).parent().off("click");
        $('li').off("mouseenter mouseleave" );

        $('li').css("background-color", "#fff");
        $(`.${winner}`).css({"background-color":"green", "color":"#fff"});
        let loser = (winner === "x" ? "o" : "x");

        $(`.${loser}`).css('color', 'red');


      } else {
        let $draw = "<figcaption class='message'>It's a draw!</figcaption>";
        $($square).parent().parent().append($draw);
        $('li').css("color", "red");
      }
    }

  }

  setupBoard() {

    let $ul = $("<ul class ='grid-board'></ul>");
    $ul.css('border','5px solid black');
    // $ul.css('border-','none');
    // $ul.css('border-bottom','none');
    $ul.width("300px");
    $ul.height("300px");



    // $ul.click((e) => {
    //   this.makeMove(e.target);
    // });


    $ul.on('click', (e) => {
      this.makeMove(e.target);
    });


    for (var i = 0; i < 9; i++) {
      let $li = $(`<li class='square' id = square${i} > </li>`);
      // $li.width("90px");
      // $li.height("90px");
      // $li.css('border','5px solid black');
      // $li.css('background-color','grey');
      // $li.css('float','left');
      $li.data('pos', [Math.floor(i / 3), i % 3])

      $li.hover(function() {
        $(this).addClass('hover');
      },function(){
        $(this).removeClass('hover');
      });

      // $li.hover(function() {
      //     $(this).css("background-color", "yellow");
      //   }, function() {
      //     $(this).css("background-color", "grey");
      // });


      // $li.hover(alert(1))
      $ul.append($li);

    }

    this.el.append($ul);
  }
}

module.exports = View;


/***/ }),
/* 3 */
/***/ (function(module, exports, __webpack_require__) {

const Board = __webpack_require__(4);
const MoveError = __webpack_require__(0);

class Game {
  constructor() {
    this.board = new Board();
    this.currentPlayer = Board.marks[0];
  }

  isOver() {
    return this.board.isOver();
  }

  playMove(pos) {
    this.board.placeMark(pos, this.currentPlayer);
    this.swapTurn();
  }

  promptMove(reader, callback) {
    const game = this;

    this.board.print();
    console.log(`Current Turn: ${this.currentPlayer}`);

    reader.question('Enter rowIdx: ', rowIdxStr => {
      const rowIdx = parseInt(rowIdxStr);
      reader.question('Enter colIdx: ', colIdxStr => {
        const colIdx = parseInt(colIdxStr);
        callback([rowIdx, colIdx]);
      });
    });
  }

  run(reader, gameCompletionCallback) {
    this.promptMove(reader, move => {
      try {
        this.playMove(move);
      } catch (e) {
        if (e instanceof MoveError) {
          console.log(e.msg);
        } else {
          throw e;
        }
      }

      if (this.isOver()) {
        this.board.print();
        if (this.winner()) {
          console.log(`${this.winner()} has won!`);
        } else {
          console.log('NO ONE WINS!');
        }
        gameCompletionCallback();
      } else {
        // continue loop
        this.run(reader, gameCompletionCallback);
      }
    });
  }

  swapTurn() {
    if (this.currentPlayer === Board.marks[0]) {
      this.currentPlayer = Board.marks[1];
    } else {
      this.currentPlayer = Board.marks[0];
    }
  }

  winner() {
    return this.board.winner();
  }
}

module.exports = Game;


/***/ }),
/* 4 */
/***/ (function(module, exports, __webpack_require__) {

const MoveError = __webpack_require__(0);

class Board {
  constructor() {
    this.grid = Board.makeGrid();
  }

  isEmptyPos(pos) {
    if (!Board.isValidPos(pos)) {
      throw new MoveError('Is not valid position!');
    }

// console.log(this.grid[pos[0]][pos[1]]);
    return (this.grid[pos[0]][pos[1]] === null);
  }

  isOver() {
    if (this.winner() != null) {
      return true;
    }

    for (let rowIdx = 0; rowIdx < 3; rowIdx++) {
      for (let colIdx = 0; colIdx < 3; colIdx++) {
        if (this.isEmptyPos([rowIdx, colIdx])) {
          return false;
        }
      }
    }

    return true;
  }

  placeMark(pos, mark) {
    if (!this.isEmptyPos(pos)) {
      throw new MoveError('Is not an empty position!');
    }

    this.grid[pos[0]][pos[1]] = mark;
    // console.log(this.grid[pos[0]][pos[1]]);
  }

  print() {
    const strs = [];
    for (let rowIdx = 0; rowIdx < 3; rowIdx++) {
      const marks = [];
      for (let colIdx = 0; colIdx < 3; colIdx++) {
        marks.push(
          this.grid[rowIdx][colIdx] ? this.grid[rowIdx][colIdx] : " "
        );
      }
      strs.push(`${marks.join('|')}\n`);
    }

    console.log(strs.join('-----\n'));
  }

  winner() {
    const posSeqs = [
      // horizontals
      [[0, 0], [0, 1], [0, 2]],
      [[1, 0], [1, 1], [1, 2]],
      [[2, 0], [2, 1], [2, 2]],
      // verticals
      [[0, 0], [1, 0], [2, 0]],
      [[0, 1], [1, 1], [2, 1]],
      [[0, 2], [1, 2], [2, 2]],
      // diagonals
      [[0, 0], [1, 1], [2, 2]],
      [[2, 0], [1, 1], [0, 2]]
    ];

    for (let i = 0; i < posSeqs.length; i++) {
      const winner = this.winnerHelper(posSeqs[i]);
      if (winner != null) {
        return winner;
      }
    }

    return null;
  }

  winnerHelper(posSeq) {
    for (let markIdx = 0; markIdx < Board.marks.length; markIdx++) {
      const targetMark = Board.marks[markIdx];
      let winner = true;
      for (let posIdx = 0; posIdx < 3; posIdx++) {
        const pos = posSeq[posIdx];
        const mark = this.grid[pos[0]][pos[1]];

        if (mark != targetMark) {
          winner = false;
        }
      }

      if (winner) {
        return targetMark;
      }
    }

    return null;
  }

  static isValidPos(pos) {
    return (0 <= pos[0]) &&
    (pos[0] < 3) &&
    (0 <= pos[1]) &&
    (pos[1] < 3);
  }

  static makeGrid() {
    const grid = [];

    for (let i = 0; i < 3; i++) {
      grid.push([]);
      for (let j = 0; j < 3; j++) {
        grid[i].push(null);
      }
    }

    return grid;
  }
}

Board.marks = ['x', 'o'];

module.exports = Board;


/***/ })
/******/ ]);