// ignore_for_file: prefer_const_constructors, deprecated_member_use, prefer_collection_literals

import 'package:flutter/material.dart';

import '../button_class.dart';

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
        gb.bgc = Colors.red.shade900;
        acitvePlayer = 2;
        player1.add(gb.id);
      } else {
        gb.text = "0";
        gb.bgc = Colors.green;
        acitvePlayer = 1;
        player2.add(gb.id);
      }
      gb.enabled = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        title: Text("Tic Tac Toe"),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 40,
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 5, mainAxisSpacing: 5),
          itemCount: buttonList.length,
          itemBuilder: (BuildContext context, int index) {
            return ElevatedButton(
              onPressed: buttonList[index].enabled
                  ? () => playGame(buttonList[index])
                  : null,
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(buttonList[index].bgc)),
              child: Text(
                buttonList[index].text,
                style: TextStyle(fontSize: 60, color: Colors.white),
              ),
            );
          },
        ),
      ),
    );
  }
}
