// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:tic/logic.dart';

class MyHome extends StatefulWidget {
  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  // who player is active
  String activeplayer = 'X';
  // the game was active but it equl true the game ended
  bool gameover = false;
  // num of time for play
  int turn = 0;
  // who's player win
  String result = '';
  // creat an object from class Game
  Game game = Game();
  // play with device or your friend
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
          child: Column(
        children: [
          SwitchListTile.adaptive(
              title: Text(
                'Turn on /off two player',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                ),
                textAlign: TextAlign.center,
              ),
              // value required for swich and  take bool value like is switched
              value: isSwitched,
// changed on value now and create any name as you like
              onChanged: (bool newvalue) {
                // form my state isswitched equel new value
                setState(() {
                  isSwitched = newvalue;
                });
              }),
          SizedBox(
            height: 10.0,
          ),
          Text(
            'It\'s $activeplayer turn'.toUpperCase(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 50.0,
            ),
            textAlign: TextAlign.center,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: GridView.count(
              crossAxisCount: 3,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              childAspectRatio: 1.0,
              children: List.generate(
                9,
                (index) => InkWell(
                  borderRadius: BorderRadius.circular(15.0),
                  onTap:
                      // inline if < if gameover true means game end  return null else return ontp methods

                      gameover ? null : () => ontp(index),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).shadowColor,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Center(
                        child: Text(
                      // playerx contains index  الل هو انا ضاغط عليه
                      Player.playerX.contains(index)
                          ? 'X'
                          : Player.playerO.contains(index)
                              ? 'o'
                              : '',
                      style: TextStyle(
                          // if color =player X blue :pink
                          color: Player.playerX.contains(index)
                              ? Colors.blue
                              : Colors.pink,
                          fontSize: 52.0),
                    )),
                  ),
                ),
              ),
            ),
          )),
          Text(
            result,
            style: TextStyle(
              color: Colors.white,
              fontSize: 40.0,
            ),
            textAlign: TextAlign.center,
          ),
          ElevatedButton.icon(
            onPressed: () {
              // take value from current state to default value
              setState(() {
                Player.playerX = [];
                Player.playerO = [];
                activeplayer = 'X';
                gameover = false;
                turn = 0;
                result = '';
              });
            },
            icon: Icon(Icons.replay),
            label: Text('Repeat The Game'),
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Theme.of(context).splashColor)),
          ),
        ],
      )),
    );
  }

  ontp(int index) async {
    // if playerx empty or not equel value of index
    if ((Player.playerX.isEmpty || !Player.playerX.contains(index)) ||
        (Player.playerO.isEmpty || !Player.playerO.contains(index))) {
      // methods for start game
      // .~. game is object from class Game ::it inherit
      game.playgame(index, activeplayer);
      //if  activeplayer =x ::is true  o if o it x
      updatestate();
      if (!isSwitched && !gameover) {
        await game.autoplay(activeplayer);
        updatestate();
      }
    }
  }

  void updatestate() {
    setState(() {
      activeplayer = (activeplayer == 'x') ? 'o' : 'x';
      String winnerplayer = game.checkWiner();
      if (winnerplayer != '') {
        result = '$winnerplayer is the winner';
      }
      else {
                result = 'It\'s Draw !';

      }
    });
  }
}
