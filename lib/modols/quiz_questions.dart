class QuizQuestions {
 const  QuizQuestions(this.quest,this.answers);
 final String quest;
 final List<String> answers;

 List<String> getShuffledAnswer(){
  //list here as a class
 final shuffledList= List.of(answers);
 shuffledList.shuffle();
 return shuffledList;

 }
}