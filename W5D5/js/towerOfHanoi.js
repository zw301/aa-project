const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

class Game {
  constructor() {
    this.stacks = [[3, 2, 1], [], []]
  }

  run(reader, gameCompletionCallback) {
    this.promptMove(reader, (fromTower, toTower) => {
       if (!this.move(fromTower, toTower)) {
         console.log("Invalid move!");
       }

       if (!this.isWon()) {
         // Continue to play!
         this.run(reader, gameCompletionCallback);
       } else {
         this.print();
         console.log("You win!");
         gameCompletionCallback();
       }
    });
  }
};

Game.prototype.promptMove = function(reader, callback) {
  //(1) prints the stacks
  //(2) asks the user where they want to move a disc to/from.
  //    Pass the startTowerIdx and endTowerIdx to a callbac
  console.log(`Pile 0: ${this.stacks[0]}\nPile 1: ${this.stacks[1]}\nPile 2: ${this.stacks[2]}\n`)
  reader.question("Which pile you want to move?(0, 1, 2)\n", function(numFrom) {
    reader.question("Which pile you want to put?(0, 1, 2)\n", function(numTo) {
      let fromTower = parseInt(numFrom);
      let toTower = parseInt(numTo);
      callback(fromTower, toTower);
    });
  });
}

Game.prototype.isValidMove = function(fromTower, toTower) {
  //checks that you can move the top of startTowerIdx onto the top of endTowerIdx.
  //Test it by passing in dummy variables and make sure it works before you move on.
  let fromStack = this.stacks[fromTower];
  let toStack = this.stacks[toTower];

  if (toStack.length === 0) {
    return true;
  } else if (fromStack.length === 0) {
    return false;
  }
  return fromStack[fromStack.length - 1] < toStack[toStack.length - 1];
}

Game.prototype.move = function(startTowerIdx, endTowerIdx) {
  this.stacks[endTowerIdx].push(this.stacks[startTowerIdx].pop());
  return true;
}


Game.prototype.print = function(){
  console.log(JSON.stringify(this.stack));
}

Game.prototype.isWon = function(){
  return (this.stacks[0].length === 0) &&
      (this.stacks[1].length === 0 || this.stacks[2].length === 0);
}

function completion() {
  reader.question("Play again? y or n: ", restartGame => {
    if (restartGame === "y") {
      g = new Game();
      g.run(reader, completion);
    } else {
      reader.close();
    }
  });
};

let game = new Game();
game.run(reader, completion)
// console.log(game.isValidMove(0, 2))
