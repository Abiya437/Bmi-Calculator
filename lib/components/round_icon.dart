import 'package:flutter/material.dart';


class RIconButton extends StatelessWidget {
  // const RIconButton({super.key});
  RIconButton({required this.icon,required this.onPressed});
  final IconData icon;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        constraints:  BoxConstraints.tightFor(
          height: 45.0,
          width: 40.0,
        ),
        shape: CircleBorder(),
        fillColor:  Color(0xFF4C4F5E),
        onPressed: onPressed,
        child: Icon(icon));
  }
}

