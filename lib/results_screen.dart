import 'package:flutter/material.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/question_summary/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget{
const ResultsScreen({super.key,required this.chosenAnsw,required this.onRestart});

final List<String> chosenAnsw;
final void Function() onRestart;
//we can use get here because of the getsummarydata has no input and just produce some data based one some other class proparty(chosenAnsw)
//get=> is still a method and the code still execute but we don't call a summaryData as a method but as a variable but internaly it behaves as a method

List<Map<String,Object>> get summaryData{
 final List<Map<String, Object>> summary=[];
 
 for(var i=0;i<chosenAnsw.length;i++){
  summary.add({
   //key=string, value=object (:) to assign value 
   'question_index':i,
   'question':questions[i].quest,
   'correct_answer':questions[i].answers[0],
   'user_answers':chosenAnsw[i]
    },
  );
 }
 return summary;
}
// where() method allows you to filter the list of which you calling it and it doesn't change your original list but instead returns a new list 
// and then you have to pass a func which will be executed for every item in the list and as map you will recieve that item as arrgument(data)
//arrow func [=>] use with anonymous func that take an input (data) and in the func body immediatly returns a value especially in list method like (where) and (map) thet don't have complex code  
//by delete {} ; return and add [=>] to concise
@override
Widget build(context){
 //final summaryData=summaryData;
 final numTotalQuestion= questions.length;
 final numCorrectQuestion=summaryData.where((data)=> data['user_answers'] == data['correct_answer']
 ).length;

  return  SizedBox(
    width:double.infinity ,
    child: Container(
      margin:const EdgeInsets.all(40),
      child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           Text(
            'You Answered $numCorrectQuestion Out Of $numTotalQuestion Questions Correctly !',
            style: GoogleFonts.lato(
             color:const Color.fromARGB(238, 255, 255, 255),
             fontSize: 20,
             fontWeight:FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          //to pass the main func (getSummaryData()) to  the quest_summ file that stored in var (summaryData) 
          //i want to rearrange the result screen to a fixed hight and i can scrolling it by going to QuestionSummary and wrap the column with sizedbox
          QuestionSummary(summaryData),
          const SizedBox(height: 30),
         
          TextButton.icon(
            onPressed: onRestart, 
            style: TextButton.styleFrom(
              foregroundColor: Colors.white
            ),
            icon:const Icon(Icons.refresh),
            label:const Text('Restart Quiz!'),
            ),
        ],
      ),
    ),
  );
}
}