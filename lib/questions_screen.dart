import 'package:flutter/material.dart';
import 'package:adv_basics/answer_button.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuesScreen extends StatefulWidget{
 const QuesScreen({super.key,required this.onSelectAnsw,});

          //it should be capetal letter Function not function 
 final void Function(String answ) onSelectAnsw;

 @override
 State<QuesScreen> createState(){
  return _QuesScreenState();
 }
}

class _QuesScreenState extends State<QuesScreen>{
var currentQuestIndex=0;

void answerQuestion(String selctedAnswers){
  //small letter
  widget.onSelectAnsw(selctedAnswers);
setState(() {
  currentQuestIndex++;
});

}



 @override
 Widget build(context){
  final currentQuest=questions[currentQuestIndex];

 return  SizedBox(
  width: double.infinity,
 //height: 300,
   child: Container(
    margin:const EdgeInsets.all(40),
     child: Column(
      //mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
         Text(
        currentQuest.quest,
        style:GoogleFonts.lato(
         color: const Color.fromARGB(255, 223, 163, 233),
         fontSize: 24,
         fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
       ),
       
        const SizedBox(height: 30,),
        ...currentQuest.getShuffledAnswer().map((item) {
          return AnswerButton(
            answ: item,
            onTap: (){answerQuestion(item);},
            );
        }),
        
        
      ],
     ),
   ),
 );


 }

}
