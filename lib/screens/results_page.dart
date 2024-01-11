import 'package:bmi_caculator/components/bottom_btn.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:bmi_caculator/components/reusable_card.dart';

class resultPage extends StatelessWidget {

  resultPage({required this.bmiResult,required this.resultText,required this.Interpretation});
  final String bmiResult;
  final String resultText;
  final String Interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
                alignment: Alignment.center,
                child: Text('Your Results...',style: kTitleStyle,))
         ),
          Expanded(
              flex: 5,
              child:ReusableCard(
                onPress: () {},
                colour: kActiveCardColour,
               cardChild:  Column(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                    Text(resultText.toUpperCase(),style: kResTextSty,),
                   Text(bmiResult,style: kBMITextSty,),
                   Text(Interpretation,
                     textAlign:TextAlign.center,style: kBodyTextSty,),
                 ],
               ),
              ),
          ),
          BottomButton(onTap:(){
            Navigator.pop(context);
          }, buttonTitle: 'Re-Calculate')
        ],
      ),
    );
  }
}
