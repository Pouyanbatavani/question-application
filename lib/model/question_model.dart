class Question {
  String question;
  String answer;
  String answer2;
  int trueAnswer;

  Question(this.question, this.answer, this.answer2, this.trueAnswer);

  bool isRight(int num) {
    if (num == 1 || num == 2) {
      if (trueAnswer == 1) {
        if (num == 1) {
          return true;
        }
        else
          return false;
      }
      else
      if (num == 2) {
        return true;
      }
      else
        return false;
    }
    else {
      print('Error In Handle');
      return false;
    }
  }
}

List<Question> questionList = [

  Question(
      'What was Meta Platforms Inc formerly known as?', 'Facebook', 'Instagram',
      1),
  Question(
      'How many hearts does an octopus have? ', '2', '3', 2),
  Question(
      'Which element is said to keep bones strong?', 'Calcium', 'Potassium', 1),
  Question(
      'Which is the biggest Country?', 'Canada', 'China', 1),
  Question(
      'Which planet in the Milky Way is the hottest?', 'pluto', 'Venus', 2),
  Question(
      'How many minutes are in a full week?', '10080', '11240', 1),
  Question(
      'Haematology is the study of what?', 'The Body', 'The blood', 2),
  Question(
      'What is the main ingredient in guacamole?', 'Onion', 'Avocado', 2),
  Question(
      'Which Soccer player have 7 Gold-Ball?', 'Cristiano', 'Messi', 2),
  Question(
      'What country has won the most World Cups?', 'Brazil', 'Italy', 1),


];