import 'dart:math';

class calBrain{
   calBrain ({required this.height,required this.weight});
  final int height;
  final int weight;
 late  double _bmi;

  String calBMI(){
   _bmi =weight/pow(height/100,2);
    return _bmi.toStringAsFixed(1);
  }
  String getRes(){
    if(_bmi >= 25){
      return 'Over Weight';
    }
    else if(_bmi > 18.5){
      return 'Normal';
    }
    else{
      return 'Under Weight';
    }
  }
  String getInterpretation(){
    if(_bmi >= 25){
      return 'You have a higher than normal body weight . Try To Excercise..';
    }
    else if(_bmi > 18.5){
      return 'You have a Normal Body. Good Job!';
    }
    else{
      return 'You have a lower than normal body weight. You can eat a bit more';
    }
  }

}