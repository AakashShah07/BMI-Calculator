import 'dart:math';

class CalculatorBrain{
  CalculatorBrain({required this.height,required this.weight});

  final int height ;
  final int weight ;

  late double _bmi;
  String calculteBMI(){
    _bmi = weight / pow(height / 100,2);
    return _bmi.toStringAsFixed(1);

  }

  String getResult(){
    if(_bmi >= 25){
      return"Overweight";
    }
    else if (_bmi>18.5){
      return "Normal";
    }
    else{
      return"Underweight";
    }
  }

  String getInterpretation(){
      if(_bmi >= 25){
        return"Overweight. Try tyo exersixe more";
      }
      else if (_bmi>18.5){
        return "Normal, Good Job";
      }
      else{
        return"Underweight, You can eat a bit  more";
      }
    }
  }

