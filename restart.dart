import 'package:flutter/material.dart';
import 'package:tictoc/constant/colors.dart';
import 'package:tictoc/constant/image.dart';

import 'package:tictoc/features/pages/home.dart';

class Restart extends StatelessWidget {
  const Restart({super.key,required this.winner});
  final String winner;


  @override
  Widget build(BuildContext context) {
    return  PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        
      },
      child: Scaffold(
        body: SafeArea(
          child:Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 50,),
                Container(
                  height:350 ,
                  width:312 ,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.transparent,),
                    
                  ),
                  
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(Appimages.won,height:180 ,width: 255,),
                     SizedBox(height: 10,),
                      Text("$winner has Won 🎉",style: TextStyle(fontSize: 24),),
                      SizedBox(height: 10,),
                      Text("Congrats on being the undisputed champion of pressing buttons like a pro.",style: TextStyle(fontSize: 16,color: Appcolors.grey),textAlign: TextAlign.center,)
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
                    child: Text("Restart",style: TextStyle(fontSize: 16,color: Colors.white,letterSpacing: 2),textAlign: TextAlign.center,))),
                ),
               )
              ],
            ),
          )
          ),
      ),
    );
  
  }
}