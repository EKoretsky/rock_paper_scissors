import 'dart:io';

import 'package:ansicolor/ansicolor.dart';

AnsiPen bluePen = AnsiPen()..blue(bold: true);
AnsiPen redPen = AnsiPen()..red(bold: true);

enum Move {rock, paper, scissors}

void main(List<String> args) {
  while(true) {
    stdout.write(bluePen('Rock, paper, scissors? (r/p/s) '));
    var input = stdin.readLineSync();

    if (input == 'q') {
      break;
    }

    if (input == 'r' || input == 'p' || input == 's') {
     print('Selected: $input');
    } else {
      print(redPen("Selected: '$input'. It's invalid input"));
    }
  }
}
