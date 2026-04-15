import 'package:flutter/material.dart';
import 'package:tictoc/constant/colors.dart';
import 'package:tictoc/constant/image.dart';
import 'package:tictoc/custom/icon.dart';
import 'package:tictoc/features/pages/game.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.yello,

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 70,
                width: 182,
                decoration: BoxDecoration(
                  color: Appcolors.brow,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
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
          SizedBox(height: 80),
          Image.asset(Appimages.logo, height: 341, width: 352),
          SizedBox(height: 50),
          Column(
            children: [
              Text(
                "Who is playing first?",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300,color: Appcolors.brown)
              ),
              SizedBox(height: 30),  
              Row( 
                children: [
                  Iconbox(
                    image:Appimages.frame1,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => Game(firstplayer: "X"),
                        ),
                      );
                    },
                  ),
                  SizedBox(width: 16),
                  Iconbox(
                     image: Appimages.frame2,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => Game(firstplayer: "O"),
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 20,),
             // Text("Read Me",style: TextStyle(fontSize: 34,color: Colors.cyan),)
            ],
          ),
        ],
      ),
    );
  }
}
