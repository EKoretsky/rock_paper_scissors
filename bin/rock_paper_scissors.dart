import 'dart:io';
import 'dart:math';

import 'package:ansicolor/ansicolor.dart';

AnsiPen bluePen = AnsiPen()..blue(bold: true);
AnsiPen redPen = AnsiPen()..red(bold: true);
AnsiPen greenPen = AnsiPen()..green(bold: true);

enum Move {rock, paper, scissors}

void main(List<String> args) {
  final randomGenerator = Random();

  while(true) {
    stdout.write(bluePen('Rock, paper, scissors? (r/p/s) '));
    var input = stdin.readLineSync();

    if (input == 'q') {
      break;
    }

    if (input == 'r' || input == 'p' || input == 's') {
      var random = randomGenerator.nextInt(3);
      var playerMove;
      var aiMove = Move.values[random];

      switch (input) {
        case 'r':
          playerMove = Move.rock;
          break;
        case 'p':
          playerMove = Move.paper;
          break;
        default:
          playerMove = Move.scissors;
          break;
      }

      print('You played: $playerMove');
      print('AI played: $aiMove');

      var winConditionOne = playerMove == Move.rock && aiMove == Move.scissors;
      var winConditionTwo = playerMove == Move.paper && aiMove == Move.rock;
      var winConditionThree = playerMove == Move.scissors && aiMove == Move.paper;

      var winConditions =  winConditionOne || winConditionTwo || winConditionThree;

      if (playerMove == aiMove) {
        print("It's draw");
      } else if (winConditions) {
        print(greenPen('You win!!!'));
      } else {
        print('You lose. AI win.');
      }

    } else {
      print(redPen("Selected: '$input'. It's invalid input"));
    }
  }
}
