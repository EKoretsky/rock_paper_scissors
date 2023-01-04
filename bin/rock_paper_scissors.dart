import 'dart:io';
import 'dart:math';

enum Move { rock, paper, scissors }

void main(List<String> args) {
  final randomGenerator = Random();

  final welcomeString = '''
==============================================
Welcome to the game of rock, paper, scissors!
==============================================
''';

  stdout.write(welcomeString);

  while (true) {
    stdout.write('Let\'s choose rock(r), paper(p), scissors(s) or quit(q): ');
    final input = stdin.readLineSync();

    if (input == 'q') {
      exit(0);
    }

    if (input == 'r' || input == 'p' || input == 's') {
      final random = randomGenerator.nextInt(3);
      late final Move playerMove;
      final aiMove = Move.values[random];

      switch (input) {
        case 'r':
          playerMove = Move.rock;
          break;
        case 'p':
          playerMove = Move.paper;
          break;
        case 's':
          playerMove = Move.scissors;
        // default:
        //
      }

      print('You played: $playerMove');
      print('AI played: $aiMove');

      final winConditionOne = playerMove == Move.rock && aiMove == Move.scissors;
      final winConditionTwo = playerMove == Move.paper && aiMove == Move.rock;
      final winConditionThree = playerMove == Move.scissors && aiMove == Move.paper;

      final winConditions = winConditionOne || winConditionTwo || winConditionThree;

      if (playerMove == aiMove) {
        stdout.write('It\'s draw\n');
      } else if (winConditions) {
        stdout.write('You win!!!🥇\n');
      } else {
        stdout.write('You lose. AI win.😢\n');
      }
    } else {
      stdout.write('Selected: $input. It\'s invalid input\n');
    }
  }
}
