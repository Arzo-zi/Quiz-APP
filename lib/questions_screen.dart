import 'package:flutter/material.dart';
import 'package:adv_basics/answer_button.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuesScreen extends StatefulWidget{
 const QuesScreen({super.key,required this.onSelectAnsw,});

          //it should be capetal letter Function not function 
          //answ =>to save the answers and keep it 
 final void Function(String answ) onSelectAnsw;

 @override
 State<QuesScreen> createState(){
  return _QuesScreenState();
 }
}

class _QuesScreenState extends State<QuesScreen>{
  //currentQuestIndex =>to make sure when we select the answer we move on to the second question and so on
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
        //instead of styleform
        style:GoogleFonts.lato(
         color: const Color.fromARGB(255, 223, 163, 233),
         fontSize: 24,
         fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
       ),
       
        const SizedBox(height: 30,),
        //map get every element in the getShuffledAnswer() and turn it to a widget without change these values in the memory unlike shuffled
        //... =>to solve problem list(answers) inside list(children)to spreading values
        ...currentQuest.getShuffledAnswer().map((item) {
          return AnswerButton(
            answ: item,
            //answerQuestion => when we push the answer button the index will increase and the next quest will appear 
            //                  it also has  selctedAnswers that is call from quiz file (3 widget) the function name (chooseAnswerByUser)
            //answerQuestion=>now accept an argument which is (String selctedAnswers) so we should add an argument here 
            onTap: (){answerQuestion(item);},
            );
        }),
        
        
      ],
     ),
   ),
 );


 }

}
