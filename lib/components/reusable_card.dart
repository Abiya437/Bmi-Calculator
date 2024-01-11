import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  // const ReusableCard({super.key,});

  ReusableCard({super.key, required this.colour,this.cardChild,required this.onPress});
  final Color colour;
  final   cardChild;
  final void Function() onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: colour,
            borderRadius: BorderRadius.circular(15.0)
        ),
      ),
    );
  }
}
