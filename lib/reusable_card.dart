import 'package:flutter/material.dart';
class Reuseable extends StatelessWidget {

  Reuseable({super.key, required this.colour, this.childCard,  this.onPress});

  final Color colour;
  Widget? childCard;
  final void Function()?  onPress ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: (){
      //   onPress;
      // },
      onTap:onPress ,

      child: Container(
        child: childCard,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}