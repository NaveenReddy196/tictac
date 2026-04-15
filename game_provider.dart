import 'package:flutter/material.dart';

class GameProvider extends ChangeNotifier {
  List<String> board = List.filled(9, "");
  late bool isXTurn;
  String winner = "";
  bool isDraw = false;

  
  void initGame(String firstPlayer) {
    board = List.filled(9, "");
    isXTurn = firstPlayer == "X";
    winner = "";
    isDraw = false;
  }

  void makeMove(int index) {
   
    if (board[index] != "" || winner != "" || isDraw) return;

    board[index] = isXTurn ? "X" : "O";
    isXTurn = !isXTurn;
    
    _checkWinner();
    notifyListeners(); 
  }

  void _checkWinner() {
    List<List<int>> patterns = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8],
      [0, 3, 6], [1, 4, 7], [2, 5, 8],
      [0, 4, 8], [2, 4, 6],
    ];

    for (var pattern in patterns) {
      String a = board[pattern[0]];
      String b = board[pattern[1]];
      String c = board[pattern[2]];

      if (a != "" && a == b && b == c) {
        winner = a;
        return;
      }
    }

    if (!board.contains("") && winner == "") {
      isDraw = true;
    }
  }
}