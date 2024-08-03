import 'package:flutter/material.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:adv_basics/questions_screen.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/results_screen.dart';

class MyQuiz extends StatefulWidget {
    //constructor function
  const MyQuiz({super.key});

  @override
  State<MyQuiz> createState() {
  return   _MyQuizState() ;
  }
}

//we put the container here to fix the color in all screens

class _MyQuizState extends State<MyQuiz> {
 List<String> selctedAnswers=[]; 
// var<=wedget(object )
 var activeScreen='first';

 void switchScreen (){
  setState(() {
    activeScreen= 'questions screen';
  });
}
 void chooseAnswerByUser(String answ){
  selctedAnswers.add(answ);
  if (selctedAnswers.length==questions.length){
    setState(() {
      activeScreen='result-screen';
      selctedAnswers=[]; 
    });
  }
 }


  @override
  Widget build(context) {

   Widget screenWidget=StartScreen(switchScreen);

   if (activeScreen == 'questions screen'){
    screenWidget= QuesScreen(onSelectAnsw:chooseAnswerByUser,);
   }
   if (activeScreen == 'result-screen'){
    screenWidget= ResultsScreen(chosenAnsw: selctedAnswers,);
   }
    return  MaterialApp(
    home:Scaffold(

     body:Container(
      decoration: const BoxDecoration(
       gradient: LinearGradient(
        colors: [
        Colors.purple,
        Colors.deepPurpleAccent,
        ],
        begin:Alignment.centerRight,
        end: Alignment.centerLeft,
        
        ),
     ),
      
      child : screenWidget,
      
    ),
  ) 
       
);
  }
}