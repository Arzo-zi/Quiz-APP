import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adv_basics/question_summary/question_identifier.dart';
//            the items of the map
class SummaryItem extends StatelessWidget {
  const SummaryItem( this.itemData ,{super.key});

 final Map<String,Object>  itemData;
  @override
  Widget build(BuildContext context) {
     final isCorrectAnswer = itemData['user_answers'] == itemData['correct_answer'];


    return   Padding(
      //the distance between the questions overall
      padding:const EdgeInsets.symmetric(
        vertical: 8,
      ),

      child: Row(
        //the position of the questionNumber (that exist of the left side) will be at the beginning of the questions
        crossAxisAlignment: CrossAxisAlignment.start,
      
        children: [
              QuestionIdentifier( // for all indexes of questionNumber (it's a row)
              isCorrectAnswer: isCorrectAnswer,
              questionIndex: itemData['question_index'] as int,
              ),

          //between the questionNumber and the question (it's row)    
          const SizedBox(width: 20),

             Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children :[
                      Text(
                        itemData['question'] as String,
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),  
                      ),


                      const SizedBox(
                        height: 5,
                      ),


                       Text(
                        itemData['user_answers']as String,
                        style:const TextStyle(
                          color: Color.fromARGB(255, 212, 149, 241),
                        )),
                       Text (
                        itemData['correct_answer']as String,
                        style:const TextStyle(
                          color: Color.fromARGB(255, 155, 230, 234),
                        )),    
                    ],
                ),
             ),
          ],
        ),  
      );
  }
}

        //     Text((( data['question_index'] as int)  + 1).toString()),