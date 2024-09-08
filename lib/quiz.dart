import 'package:flutter/material.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:adv_basics/questions_screen.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/results_screen.dart';

//third widget to connect start with question screan

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
//the answers from students to show it later in last screen
 List<String> selctedAnswers=[]; 
// var<=wedget(object )
 var activeScreen='first';

 void switchScreen (){
  setState(() {
    activeScreen= 'questions screen';
  });
}

// to pass the data via func across widget
// answ => the answer that appears in the button from answer button file
//add=>will adding values to the list
//selctedAnswers=>an empty list
// if (selctedAnswers.length==questions.length)=> to deny repeat the questions again and if this condition acheive the result screen will active
//selctedAnswers=[]; => if we did not empty the selctedAnswers each time will open the app will save the previos answers and the condition if will not acheive

 void chooseAnswerByUser(String answ){
  selctedAnswers.add(answ);
  if (selctedAnswers.length==questions.length){
    setState(() {
      activeScreen='result-screen';
    //  selctedAnswers=[]; this list should remove to pass the answers to the result-screen
    });
  }
 }


  @override
  Widget build(context) {

   //pass the second screan questionsscreen by switched screen to the first screen StartScreen because it has a button
   // 1 lefting up state 
   Widget screenWidget=StartScreen(switchScreen);

   // 2 lefting up state 
   if (activeScreen == 'questions screen'){
    screenWidget= QuesScreen(onSelectAnsw:chooseAnswerByUser,);
   }
   if (activeScreen == 'result-screen'){
    screenWidget= ResultsScreen(chosenAnsw: selctedAnswers,);
   }
   //go to the questions_screen to accept this argument


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