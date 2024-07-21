import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainer2 extends StatefulWidget{
  const AnimatedContainer2({super.key});

  @override
  State<AnimatedContainer2> createState() => _AnimatedContainer();

}

class _AnimatedContainer extends State<AnimatedContainer2>{

  double height = 100;
  double width = 100;
  Color color = Colors.greenAccent;
  BorderRadiusGeometry borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blueGrey,title:const Text("Animated Container"),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: AnimatedContainer(
              height: height,
                width: width,
                curve: Curves.bounceInOut,
                duration: const Duration(milliseconds: 400),
              decoration: BoxDecoration(color: color, borderRadius: borderRadius),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
         Random random = Random();
         height = random.nextInt(300).toDouble();
         width = random.nextInt(300).toDouble();
         color = Color.fromRGBO(
           random.nextInt(256),
           random.nextInt(256),
           random.nextInt(256),
           1
         );
         borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
         setState(() {

         });
      }, child: const Icon(Icons.refresh),),
    );
  }

}