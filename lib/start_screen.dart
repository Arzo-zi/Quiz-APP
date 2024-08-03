import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
  
class StartScreen extends StatelessWidget{
  const StartScreen(this.startConnect,{super.key});

 //it should be capetal letter Function not function 
  final VoidCallback startConnect;

@override
Widget build(context){
return  Center(
  
  child :Column(
    mainAxisSize: MainAxisSize.min,
    children: [
     
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 250,
          color:const Color.fromARGB(135, 252, 251, 249)
        ),
     

      const SizedBox(height: 30),

       Text(
        'Learn Flutter The Fun Way!',
        style: GoogleFonts.lato(
          fontSize: 20  ,
          color: Colors.white,),
      ),

       const SizedBox(height: 20,),
      OutlinedButton.icon(


        onPressed: startConnect, 


        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white,
        ),
        icon: const Icon(Icons.arrow_right_alt),
        label:const  Text('Start Quiz'))
    ],
  ),
);

   }
}