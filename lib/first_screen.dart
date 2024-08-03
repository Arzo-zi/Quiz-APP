import 'package:flutter/material.dart'; 
 
 
class FirstScreen extends StatelessWidget{
const  FirstScreen({super.key});
@override
Widget build(context){
return
Center(
        child:Column(
          mainAxisSize: MainAxisSize.min ,
          children:[

            
            Image.asset(
             'assets/images/quiz-logo.png',
             width: 250,

             ),
             const Padding(
              padding: EdgeInsets.only(
                bottom: 30,
              ),
              ),
            
             const  Text(
             'Learn Flutter The Fun Way!',
              style: TextStyle(
              color: Colors.white,
              fontSize: 20,
          ),
         ), 

            const SizedBox(height: 24,),

            OutlinedButton(
              onPressed:(){},
              style:OutlinedButton.styleFrom(
               foregroundColor: const Color.fromARGB(255, 255, 255, 255),
              ),

             child:const Text('Start Quiz',), 
    
      ),

      
          ],
        ),
      );
}
}