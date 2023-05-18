import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:snake_game/snakepixel.dart';
import 'blankpixel.dart';
import 'foodpixel.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

enum SnakeDirection { UP, DOWN, LEFT, RIGHT }

class _HomeState extends State<Home> {
  //grid dimensions
  int rowsize = 10;
  int totalnumberofsq = 100;
  int currentScore = 0;
  bool gameHasStarted = false;
  //snake pos
  List<int> snakepos = [0];

  // food position
  int foodpos = 55;
  var currentDirection = SnakeDirection.RIGHT;

  void startGame() {
    gameHasStarted = true;
    Timer.periodic(const Duration(milliseconds: 200), (timer) {
      setState(() {
        //keep the snake moving
        moveSnake();

        if (gameOver()) {
          timer.cancel();

          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog(
                  title: const Center(
                    child: Text('GAME OVER'),
                  ),
                  content: Column(
                    children: [
                      Text('Your Score is: ' + currentScore.toString()),
                      const TextField(
                        decoration: InputDecoration(
                            hintText: 'Enter Name',
                            hintStyle: TextStyle(color: Colors.black)),
                      )
                    ],
                  ),
                  actions: [
                    MaterialButton(
                      onPressed: () {
                        submitScore();
                        Navigator.pop(context);
                        newGame();
                      },
                      child: Text(
                        'Enter Name',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.black,
                    )
                  ],
                );
              });
        }
        ;
      });
    });
  }

  void newGame() {
    setState(() {
      List<int> snakepos = [0];
    });
    foodpos = 55;
    currentScore = 0;
    currentDirection = SnakeDirection.RIGHT;
    gameHasStarted = false;
  }

  void submitScore() {}
  bool gameOver() {
    List<int> bodySmake = snakepos.sublist(0, snakepos.length - 1);
    if (bodySmake.contains(snakepos.last)) {
      return true;
    }
    return false;
  }

  void eatfood() {
    currentScore++;
    while (snakepos.contains(foodpos)) {
      foodpos = Random().nextInt(totalnumberofsq);
    }
  }

  void moveSnake() {
    switch (currentDirection) {
      case SnakeDirection.RIGHT:
        {
          if (snakepos.last % rowsize == 9) {
            snakepos.add(snakepos.last + 1 - rowsize);
          } else {
            snakepos.add(snakepos.last + 1);
          }
        }
        break;

      case SnakeDirection.LEFT:
        {
          if (snakepos.last % rowsize == 0) {
            snakepos.add(snakepos.last - 1 + rowsize);
          } else {
            snakepos.add(snakepos.last - 1);
          }
        }
        break;

      case SnakeDirection.UP:
        {
          if (snakepos.last < rowsize) {
            snakepos.add(snakepos.last - rowsize + totalnumberofsq);
          } else {
            snakepos.add(snakepos.last - rowsize);
          }
        }
        break;

      case SnakeDirection.DOWN:
        {
          if (snakepos.last + rowsize > totalnumberofsq) {
            snakepos.add(snakepos.last + rowsize - totalnumberofsq);
          } else {
            snakepos.add(snakepos.last + rowsize);
          }
        }
        break;
      default:
    }
    // eating food
    if (snakepos.last == foodpos) {
      eatfood();
    } else {
      snakepos.removeAt(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Current Score',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        currentScore.toString(),
                        style:
                            const TextStyle(fontSize: 36, color: Colors.white),
                      ),
                    ],
                  ),
                  const Text(
                    'HighScores',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: GestureDetector(
                onVerticalDragUpdate: (details) {
                  if (details.delta.dy > 0 &&
                      currentDirection != SnakeDirection.UP) {
                    currentDirection = SnakeDirection.DOWN;
                  } else if (details.delta.dy < 0 &&
                      currentDirection != SnakeDirection.DOWN) {
                    currentDirection = SnakeDirection.UP;
                  }
                },
                onHorizontalDragUpdate: (details) {
                  if (details.delta.dx > 0 &&
                      currentDirection != SnakeDirection.LEFT) {
                    currentDirection = SnakeDirection.RIGHT;
                  } else if (details.delta.dx < 0 &&
                      currentDirection != SnakeDirection.RIGHT) {
                    currentDirection = SnakeDirection.LEFT;
                  }
                },
                child: GridView.builder(
                  itemCount: totalnumberofsq,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: rowsize),
                  itemBuilder: (context, index) {
                    if (snakepos.contains(index)) {
                      return const SnakePixel();
                    } else if (foodpos == index) {
                      return const FoodPixels();
                    } else {
                      return const BlankPixel();
                    }
                  },
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: MaterialButton(
                        child: Text('PLAY'),
                        color: gameHasStarted ? Colors.grey : Colors.white,
                        onPressed: gameHasStarted ? () {} : startGame,
                      ),
                    ),
                    Column(
                      children: const [
                        Text(
                          'Developed by:  xxxxx',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          'xxxxx',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
