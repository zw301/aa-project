const View = require("./ttt-view.js"); // require appropriate file
const Game = require('../../solution/game'); // require appropriate file

$( () => {
  // Your code here
  const rootEl = $('.ttt');
  const game = new Game();
  new View(game, rootEl);
});
