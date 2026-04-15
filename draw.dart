import 'package:flutter/material.dart';
import 'package:tictoc/constant/colors.dart';
import 'package:tictoc/constant/image.dart';

import 'package:tictoc/features/pages/home.dart';

class Replay extends StatelessWidget {
  const Replay({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        
      },
      child: Scaffold(
        body: SafeArea(
          
          child:Padding(
            padding: const EdgeInsets.all( 10.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 50,),
                  Container(
                    height:300 ,
                    width:312 ,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Colors.transparent,),
              
                    ),
                    
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(Appimages.logo,height:180 ,width: 255,),
                       SizedBox(height: 10,),
                        Text("It’s a Draw!",style: TextStyle(fontSize: 24),),
                        SizedBox(height: 10,),
                        Text("Congrats to both of you for equally excelling in the art of not winning.",style: TextStyle(fontSize: 16,color: Appcolors.grey),textAlign: TextAlign.center,)
                      ],
                    ),
               
                  ),
                  SizedBox(height: 40,),
                 Container(
                  width: 167,
                  height: 72,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(56)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                      },
                      child: Text("Replay",style: TextStyle(fontSize: 16,color: Colors.white),textAlign: TextAlign.center,))),
                  ),
                 )
                ],
              ),
            ),
          )
          ),
      ),
    );
  }
}