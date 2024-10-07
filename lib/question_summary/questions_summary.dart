import 'package:flutter/material.dart';
import 'package:adv_basics/question_summary/question_item.dart';
//             the original Map
class QuestionSummary extends StatelessWidget{
  //the constructure func
  const QuestionSummary(this.summaryData,{super.key});
  //to accept proporty 
  //we need to pass the map so we should define the same type
  final List<Map<String,Object>> summaryData ;

  @override
  Widget build(BuildContext context) {
    //every row should represent one piece of summaryData so one map of summaryData
    //we always used to enter the children manually but here we have list of map so wo should use it   
    //but children want a list of widget not maps!
    //so we should transform from a list of maps to a list of widget by calling the summaryData and calling the map method on that list 
    //(map) method is different from (Map) type |(map)simply means map the value to a new value
    // map((){})=> (){} => this means to pass our function to a map method
    //inside of it ,it will return the widget
    //row also accept list of child widget
    //the error is Iterable can't be assigned to the list type 'Widget' (map is iterable like the list but not entirly the same)
    //toList()=>to convert the map to list to solve the error and put it after the map
    //the question should be index+1 because the question should not start from 0
    //data['question_index']=>calling the map values like calling a list values by['the element name']
    //data is the map!
    //+ will cause an error because the value of the map identify as an object so the compilar doesn't know which type is it 
    //to solve this error use type casting : by use (as) keyword to reminder dart about its type and put it inside ()
    //now overall will appear a new error that text should return a string value so solve it by wrap it with .toString()
   
   
    return SizedBox(//the biggest one
      height:300 ,
      //the column will cut off if it exceed that box
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data){
          return SummaryItem(data);
          },
          ).toList(),
        ),
      ),
    );
  }
}