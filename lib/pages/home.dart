import 'package:flutter/material.dart';
import 'package:rock_paper_scissors/ui_factory/ui_factory.dart';
import 'package:rock_paper_scissors/utils/utils.dart';
import 'package:rock_paper_scissors/pages/reset_score.dart';
//import 'package:rock_paper_scissors/pages/who_won.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  HomePageState createState() => HomePageState();
}

List<Image> imgHands = [
  Image.asset('images/rock.png'),
  Image.asset('images/paper.png'),
  Image.asset('images/scissors.png')
];

var playerTappedIndex, computerRandomIndex;
var numberGames = 0, iaScore = 0, playerScore = 0;
final myController = TextEditingController();

@visibleForTesting
class HomePageState extends State<HomePage> {
  //int playerTappedIndex = 0;
  @override
  void initState() {
    super.initState();
    choosePlayerName();
    playerTappedIndex = 0;
    computerRandomIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: UIFactory().myAppBar(context),
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 25),
          child: Column(
            children: <Widget>[
              Text(
                'Let\'s play !',
                style: TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
              ),
              Text(
                'Number of game(s) : ' + '$numberGames',
                style: TextStyle(fontSize: 15),
                key: const Key('nbrGames'),
              ),
              Text(
                'Score IA : ' + '$iaScore',
                style: TextStyle(fontSize: 15),
              ),
              Text(
                'Score ' + myController.text + ' : ' + '$playerScore',
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(height: 50),
              /*
                IA will play after clicking this button 
              */
              ElevatedButton(
                child: Text('Play !'),
                onPressed: () {
                  setState(
                    () {
                      computerRandomIndex =
                          UtilsFactory().randomComputerImage() as int;
                      whoWon(computerRandomIndex, playerTappedIndex);
                    },
                  );
                },
              ),
              /*
                Reset everything to start a brand new game
              */
              ElevatedButton(
                child: Text('Reset'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
                onPressed: () {
                  setState(
                    () {
                      resetGame();
                      choosePlayerName();
                    },
                  );
                },
              ),
              SizedBox(height: 50),
              Text(
                'Your choice :',
                style: TextStyle(fontSize: 20),
              ),
              /*
                Diplay Player choice by tapping one of the choice
              */
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    child: InkWell(
                      child: Container(
                        child: imgHands[0],
                        width: 125,
                        height: 150,
                      ),
                      onTap: () {
                        setState(
                          () {
                            playerTappedIndex = 1;
                          },
                        );
                      },
                    ),
                    color: playerTappedIndex == 1 ? Colors.green : Colors.red,
                    width: 120,
                  ),
                  Container(
                    child: InkWell(
                      child: Container(
                        child: imgHands[1],
                        width: 125,
                        height: 150,
                      ),
                      onTap: () {
                        setState(
                          () {
                            playerTappedIndex = 2;
                          },
                        );
                      },
                    ),
                    color: playerTappedIndex == 2 ? Colors.green : Colors.red,
                    width: 120,
                  ),
                  Container(
                    child: InkWell(
                      child: Container(
                        child: imgHands[2],
                        width: 125,
                        height: 150,
                      ),
                      onTap: () {
                        setState(
                          () {
                            playerTappedIndex = 3;
                          },
                        );
                      },
                    ),
                    color: playerTappedIndex == 3 ? Colors.green : Colors.red,
                    width: 120,
                  ),
                ],
              ),
              SizedBox(height: 25),
              Text(
                'IA choice :',
                style: TextStyle(fontSize: 20),
              ),
              /*
                Diplay IA Choice randomly
              */
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    child: InkWell(
                      child: Container(
                        child: imgHands[0],
                        width: 125,
                        height: 150,
                      ),
                      onDoubleTap: () {
                        setState(
                          () {
                            computerRandomIndex = 1;
                          },
                        );
                      },
                    ),
                    color: computerRandomIndex == 1 ? Colors.green : Colors.red,
                    width: 120,
                  ),
                  Container(
                    child: InkWell(
                      child: Container(
                        child: imgHands[1],
                        width: 125,
                        height: 150,
                      ),
                      onDoubleTap: () {
                        setState(
                          () {
                            computerRandomIndex = 2;
                          },
                        );
                      },
                    ),
                    color: computerRandomIndex == 2 ? Colors.green : Colors.red,
                    width: 120,
                  ),
                  Container(
                    child: InkWell(
                      child: Container(
                        child: imgHands[2],
                        width: 125,
                        height: 150,
                      ),
                      onDoubleTap: () {
                        setState(
                          () {
                            computerRandomIndex = 3;
                          },
                        );
                      },
                    ),
                    color: computerRandomIndex == 3 ? Colors.green : Colors.red,
                    width: 120,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  List whoWon(iaIndex, playerIndex) {
    numberGames++;

    if (iaIndex == playerIndex) {
    } else {
      if (iaIndex == 1) {
        if (playerIndex == 2) {
          playerScore++;
        } else {
          iaScore++;
        }
      } else if (iaIndex == 2) {
        if (playerIndex == 1) {
          iaScore++;
        } else {
          playerScore++;
        }
      } else {
        if (playerIndex == 1) {
          playerScore++;
        } else {
          iaScore++;
        }
      }
    }

    return [iaIndex, playerIndex];
  }

  void choosePlayerName() {
    WidgetsBinding.instance!.addPostFrameCallback(
      (_) async {
        await showDialog<String>(
          context: context,
          builder: (BuildContext context) => new AlertDialog(
            title: new Text("Welcome to the game Rock, Paper, Scissors !"),
            actions: <Widget>[
              new Padding(
                padding: const EdgeInsets.all(16.0),
                child: new TextField(
                  controller: myController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your name',
                    labelText: 'Enter your name',
                  ),
                ),
              ),
              new TextButton(
                child: new Text("Start"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
