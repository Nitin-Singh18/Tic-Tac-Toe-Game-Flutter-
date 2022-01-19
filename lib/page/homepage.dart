// ignore_for_file: prefer_const_constructors, deprecated_member_use, prefer_collection_literals, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../button_class.dart';
import '../customdialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<GameButton> buttonList = [];
  var player1;
  var player2;
  var acitvePlayer;
  var turn = "X";

  @override
  void initState() {
    super.initState();
    buttonList = doINit();
  }

  List<GameButton> doINit() {
    player1 = [];
    player2 = [];
    acitvePlayer = 1;

    var gameButtons = <GameButton>[
      GameButton(id: 1),
      GameButton(id: 2),
      GameButton(id: 3),
      GameButton(id: 4),
      GameButton(id: 5),
      GameButton(id: 6),
      GameButton(id: 7),
      GameButton(id: 8),
      GameButton(id: 9),
    ];
    return gameButtons;
  }

  playGame(GameButton gb) {
    setState(() {
      if (acitvePlayer == 1) {
        gb.text = "X";
        // gb.bgc = Color(0xffe81750);
        gb.bgc = Color(0xff4caf50);

        acitvePlayer = 2;
        turn = "O";
        player1.add(gb.id);
      } else {
        gb.text = "O";
        gb.bgc = Color(0xffffcf34);
        acitvePlayer = 1;
        player2.add(gb.id);
        turn = "X";
      }

      gb.enabled = false;
      checkWinner();
    });
  }

  int checkWinner() {
    var winner = -1;
    if (player1.contains(1) && player1.contains(2) && player1.contains(3)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(2) && player2.contains(3)) {
      winner = 2;
    }

    if (player1.contains(4) && player1.contains(5) && player1.contains(6)) {
      winner = 1;
    }
    if (player2.contains(4) && player2.contains(5) && player2.contains(6)) {
      winner = 2;
    }

    if (player1.contains(7) && player1.contains(8) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(7) && player2.contains(8) && player2.contains(9)) {
      winner = 2;
    }

    if (player1.contains(1) && player1.contains(4) && player1.contains(7)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(4) && player2.contains(7)) {
      winner = 2;
    }

    if (player1.contains(2) && player1.contains(5) && player1.contains(8)) {
      winner = 1;
    }
    if (player2.contains(2) && player2.contains(5) && player2.contains(8)) {
      winner = 2;
    }

    if (player1.contains(3) && player1.contains(6) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(3) && player2.contains(6) && player2.contains(9)) {
      winner = 2;
    }

    if (player1.contains(1) && player1.contains(5) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(5) && player2.contains(9)) {
      winner = 2;
    }

    if (player1.contains(3) && player1.contains(5) && player1.contains(7)) {
      winner = 1;
    }
    if (player2.contains(3) && player2.contains(5) && player2.contains(7)) {
      winner = 2;
    }
    if (winner != -1) {
      if (winner == 1) {
        showDialog(
            context: context,
            builder: (_) => CustomDialog(
                title: "Congrats \n Player X Won", callback: resetGame));
      } else {
        showDialog(
            context: context,
            builder: (_) => CustomDialog(
                  title: "Player 2 Won",
                  callback: resetGame,
                ));
      }
    }
    return winner;
  }

  void resetGame() {
    if (Navigator.canPop(context)) Navigator.pop(context);
    setState(() {
      buttonList = doINit();
      turn = "X";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff392795),
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: "T",
                style: GoogleFonts.cinzel(
                  textStyle: TextStyle(
                    color: Color(0xffffcf34),
                    fontSize: 45,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              TextSpan(
                text: "I",
                style: GoogleFonts.cinzel(
                  textStyle: TextStyle(
                      color: Color(0xff4caf50),
                      fontSize: 35,
                      fontWeight: FontWeight.w900),
                ),
              ),
              TextSpan(
                  text: "C ",
                  style: GoogleFonts.cinzel(
                      textStyle: TextStyle(
                          color: Color(0xffffcf34),
                          fontSize: 35,
                          fontWeight: FontWeight.w900))),
              TextSpan(
                  text: "T",
                  style: GoogleFonts.cinzel(
                      textStyle: TextStyle(
                          color: Color(0xff4caf50),
                          fontSize: 35,
                          fontWeight: FontWeight.w900))),
              TextSpan(
                  text: "A",
                  style: GoogleFonts.cinzel(
                      textStyle: TextStyle(
                          color: Color(0xffffcf34),
                          fontSize: 35,
                          fontWeight: FontWeight.w900))),
              TextSpan(
                  text: "C",
                  style: GoogleFonts.cinzel(
                      textStyle: TextStyle(
                          color: Color(0xff4caf50),
                          fontSize: 35,
                          fontWeight: FontWeight.w900))),
              TextSpan(
                  text: " T",
                  style: GoogleFonts.cinzel(
                      textStyle: TextStyle(
                          color: Color(0xffffcf34),
                          fontSize: 35,
                          fontWeight: FontWeight.w900))),
              TextSpan(
                  text: "O",
                  style: GoogleFonts.cinzel(
                      textStyle: TextStyle(
                          color: Color(0xff4caf50),
                          fontSize: 35,
                          fontWeight: FontWeight.w900))),
              TextSpan(
                  text: "E",
                  style: GoogleFonts.cinzel(
                      textStyle: TextStyle(
                          color: Color(0xffffcf34),
                          fontSize: 35,
                          fontWeight: FontWeight.w900))),
            ],
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff392795),
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$turn's Turn",
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: turn == "X" ? Color(0xff4caf50) : Color(0xffffcf34)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Color(0xff6647c6),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 7, left: 6, right: 6, bottom: 8),
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemCount: buttonList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 110,
                      width: 110,
                      child: ElevatedButton(
                        onPressed: () {
                          if (buttonList[index].enabled) {
                            playGame(buttonList[index]);
                            print(index);
                          } else {
                            return;
                          }
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xff332268)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)))),
                        child: Text(
                          buttonList[index].text,
                          style: TextStyle(
                              fontSize: 100,
                              fontWeight: FontWeight.w900,
                              color: buttonList[index].bgc),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: resetGame,
            child: Icon(Icons.restart_alt),
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
