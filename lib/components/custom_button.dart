import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.color,
    required this.text,
     this.onPressed,
    super.key,
  });
final Color color;
final String text;
final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6)),
          fixedSize: Size(MediaQuery.of(context).size.width * 0.9, 70,),
      ), 
      child:  Text(
        text,
        style: const TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.center,
        ));
  }
}