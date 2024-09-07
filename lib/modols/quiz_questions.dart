class QuizQuestions {
 const  QuizQuestions(this.quest,this.answers);
 final String quest;
 final List<String> answers;
//Data structure

//getShuffledAnswer=>it will make a copy of answers(data) and shuffle(mix it)in the memory 
//List.of =>make the copy to keep the right answer in the first position in data file
//list here as a class
//List<String> => because answers is list of string (function)

 List<String> getShuffledAnswer(){
 final shuffledList= List.of(answers);
 shuffledList.shuffle();
 return shuffledList;

 }
}