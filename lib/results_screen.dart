import 'package:flutter/material.dart';
import 'package:adv_basics/data/questions.dart';

class ResultsScreen extends StatelessWidget{
const ResultsScreen({super.key,required this.chosenAnsw});

final List<String> chosenAnsw;

List<Map<String,Object>> getSummaryData(){
 final List<Map<String,Object>> summary=[];
 for(var i=0;i<chosenAnsw.length;i++){
  summary.add({
   //key=string, value=object (:) to assign value 
   'questions-index':i,
   'questions':questions[i],
   'correct-answer':questions[i].answers[0],
   'chosen-answers':chosenAnsw[i],
  });
 }
 return summary;
}

@override
Widget build(context){
  return  SizedBox(
    width:double.infinity ,
    child: Container(
      margin:const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('You Answered X Out Of Y Questions Correctly !'),
          const SizedBox(height: 30),
          const Text('The list here .... '),
          const SizedBox(height: 30),
          TextButton(
            onPressed: (){}, 
            child:const Text('Restart Quiz!'),
            ),
        ],
      ),
    ),
  );
}
}