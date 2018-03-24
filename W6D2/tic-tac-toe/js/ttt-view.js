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
