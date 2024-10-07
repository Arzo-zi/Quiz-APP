import 'package:flutter/material.dart';
//           designing of the left side (the question num)
class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier({
    super.key,
    required this.isCorrectAnswer,
    required this.questionIndex,
    });
final bool isCorrectAnswer;
final int  questionIndex;

  @override
  Widget build(BuildContext context) {
        final questionNumber = questionIndex + 1;
      //  the position and the colors of the questionNumber
    return Container(
      //the width and height of questionNumber 1,2,3..(the circle)
      width: 30,
      height: 30,
      //questionNumber at the center of its circle
      alignment:Alignment.center,
      decoration: BoxDecoration(
        //the color of the circle if true will be true otherwize will be red with BorderRadius
        color: isCorrectAnswer
            ? const Color.fromARGB(255, 150, 198, 241)
            : const Color.fromARGB(255, 249, 133, 241),
        borderRadius: BorderRadius.circular(100),
      ),


      //text here is the questionNumber 1,2,3... itself
      child: Text(
        questionNumber.toString(),
        style:const TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 29, 3, 101),
        ),
        
      ),
       

    );
  }
}