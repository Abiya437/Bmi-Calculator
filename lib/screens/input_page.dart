import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import 'package:bmi_caculator/components/reusable_card.dart';
import '../constants.dart';
import 'results_page.dart';
import '../components/bottom_btn.dart';
import '../components/round_icon.dart';
import 'package:bmi_caculator/cal_brain.dart';
 enum Gender{
  Male,
  Female,
 }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}
class _InputPageState extends State<InputPage> {

    Gender? selectedGender;
    int height =180;
    int weight=80;
    int age=20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        // backgroundColor: Colors.blue,
        title: Text('BMI CALCULATOR'),
      ),
      body:  Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ReusableCard(

                colour: selectedGender == Gender.Male ? kActiveCardColour : kInactiveCardColour,
                cardChild: iconContent(
                  icon: FontAwesomeIcons.mars,label: 'MALE',), onPress: (){
                  setState(() {
                    selectedGender =Gender.Male;
                  });
              },),
              ),
              Expanded(child: ReusableCard(
                colour: selectedGender == Gender.Female ? kActiveCardColour : kInactiveCardColour,
                cardChild:  iconContent(
                  icon: FontAwesomeIcons.venus,label: 'FEMALE',),onPress: (){
                  setState(() {
                    selectedGender =Gender.Female;
                  });
              },)),
            ],
          ),
          ),
          Expanded(child: ReusableCard(onPress: (){},
              colour: kInactiveCardColour,
              cardChild:   Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('HEIGHT',style: kLabelTextStyle,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(),style:kNumberTextStyle),
                      Text('cm',style: kLabelTextStyle,)
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                       inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 9.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 35.0),
                    ),
                    child: Slider(value: height.toDouble(), onChanged:(double newValue){
                      setState(() {
                        height=newValue.round();
                      });
                      } ,
                      min: 120.0,
                      max: 220.0,
                      // activeColor: Colors.white,
                      // inactiveColor: Color(0xFF8D8E98),
                    ),
                  ),
                ],
              ),
          )),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ReusableCard(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Weight',style: kLabelTextStyle,),
                    Text(
                      weight.toString(),
                      style: kNumberTextStyle,
                    ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RIconButton(icon: FontAwesomeIcons.plus,
                          onPressed: () {
                          setState(() {
                            weight++;
                          });
                        },),
                        SizedBox(
                          width: 10.0,
                        ),
                        RIconButton(icon: FontAwesomeIcons.minus,
                          onPressed: () {
                            setState(() {
                              weight--;
                            });
                          },),
                      ],
                    )
                  ],
                ),
                colour: kInactiveCardColour, onPress: () {  },)),
              Expanded(child: ReusableCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Age',style: kLabelTextStyle,),
                      Text(
                        age.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RIconButton(icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },),
                          SizedBox(
                            width: 10.0,
                          ),
                          RIconButton(icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },),],
                      )
                    ],
                  ),
                  onPress: (){},
                  colour: kInactiveCardColour)),
            ],
          ),
          ),
           BottomButton(buttonTitle: 'CALCULATE',onTap: (){
             calBrain cal = calBrain(height: height, weight: weight);
           Navigator.push(context, MaterialPageRoute(builder: (context) => resultPage(
             bmiResult: cal.calBMI(),
             resultText: cal.getRes(),
             Interpretation: cal.getInterpretation(),
           )));
           },)
        ],
      ),
    );
  }
}






