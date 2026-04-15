import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictoc/constant/colors.dart';
import 'package:tictoc/constant/image.dart';
import 'package:tictoc/features/authentication/controller/game_provider.dart';
import 'package:tictoc/features/pages/draw.dart';
import 'package:tictoc/features/pages/restart.dart';
class Game extends StatelessWidget {
  final String firstplayer;
  const Game({super.key, required this.firstplayer});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      
      create: (context) => GameProvider()..initGame(firstplayer),
      child: const GameScreen(),
    );
  }
}

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
   
    final gameProvider = context.watch<GameProvider>();

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        
      },
      child: Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 70,
                  width: 182,
                  decoration: BoxDecoration(
                    color: Appcolors.brow,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 30.0),
                    child: Text(
                      "Tic Tac Toe",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Text(
              "Player's Turn: ${gameProvider.isXTurn ? "X" : "O"}",
              style: const TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 90),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 9,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    
                    final provider = context.read<GameProvider>();
                    provider.makeMove(index);
      
                   
                    if (provider.winner != "") {
                      Future.delayed(const Duration(milliseconds: 300), () {
                        showModalBottomSheet(
                          context: context,
                          isDismissible: false,
                          builder: (context) => SizedBox(
                            child: Restart(winner: provider.winner),
                          ),
                        );
                      });
                    } else if (provider.isDraw) {
                      Future.delayed(const Duration(milliseconds: 300), () {
                        showModalBottomSheet(
                          context: context,
                          isDismissible: false,
                          builder: (context) => const SizedBox(
                            child: Replay(),
                          ),
                        );
                      });
                    }
                  },
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      border: Border.all(color: Appcolors.whit, width: 3),
                      color: gameProvider.board[index] == ""
                          ? Appcolors.gre
                          : gameProvider.board[index] == "X"
                              ? Appcolors.yello
                              : Appcolors.pink,
                    ),
                    child: Center(
                      child: gameProvider.board[index] == ""
                          ? const SizedBox()
                          : Image.asset(
                              gameProvider.board[index] == "X"
                                  ? Appimages.frame1
                                  : Appimages.frame2,
                              width: 68.5,
                              height: 70,
                            ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}