import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key,required this.answ,required this.onTap});

  final String answ;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap, 
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 22, 0, 145),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        padding:const EdgeInsets.symmetric(vertical: 10,horizontal: 40,)
      ),
      child:Text(answ,
      textAlign: TextAlign.center,
      ),
      );
  }
}