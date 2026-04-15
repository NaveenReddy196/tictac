import 'package:flutter/material.dart';



class Iconbox extends StatefulWidget { 
  final String image;
  final VoidCallback onTap;
  //final Color color;
  const Iconbox({
    super.key,
    required this.image,
    required this.onTap,
   // required this.color,
  }
  );

  @override
  State<Iconbox> createState() => _IconboxState();
}

class _IconboxState extends State<Iconbox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 80,
        width: 148,
       
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80),
        border: Border.all(color: Colors.brown,width: 1),
          color: Colors.white
        ),
        child: IconButton(
          onPressed: widget.onTap,
          icon: Image.asset(widget.image,height: 25,),),
        ),
      );
    
  }
}
