import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import "../components/icon_content.dart";
import '../components/reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/constants.dart';
import 'results_page.dart';
import '../components/bottom_button.dart';
import '../components/roundicon_button.dart';
import "package:bmi_calculator/calculator_file.dart";

 enum GenderType{
  male,
  female,
}


class InputPage extends StatefulWidget {
  const InputPage({Key key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

   GenderType gender;
   int height = 180;
   int weight=40;
   int age = 20;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("BMI CALCULATOR",
          style: TextStyle(
            fontSize: 25.0,
          ),
        ),
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
            children: [
              Expanded(child: ReusableCard(
                  onPress:(){
                    setState(() {
                      gender=GenderType.male;
                    });

                  },
                  colour: gender== GenderType.male? kactiveCardColor : kinactiveCardColor,
                  cardChild:  IconContent(icon: FontAwesomeIcons.mars , label: "MALE",),
              ),
              ),
              Expanded(child:ReusableCard(
                onPress: (){
                  setState(() {
                    gender=GenderType.female;
                  });
                },
                colour: gender== GenderType.female? kactiveCardColor : kinactiveCardColor,
                cardChild: IconContent(
                  icon: FontAwesomeIcons.venus ,
                  label: "FEMALE",
                ),
              ),
              ),
            ],
          )),
          Expanded(child:
          ReusableCard(
              colour:kactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: klabelTextStyle,
                  ),
                  SizedBox(
                    height:3.0,
                  ),  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        "cm",
                        style: klabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      overlayColor: Color(0x29EB1555),
                      thumbColor: Color(0xFFEB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 13.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 26.0),
                    ),
                    child: Slider(
                      value:height.toDouble(),
                      min:120.0,
                      max:220.0,
                      onChanged: (double newvalue){
                        setState(() {
                          height=newvalue.toInt();
                        });
                      },
                    ),
                  ),
                ],
              ),
          ),
          ),
          Expanded(
              child:  Row(
            children: [
              Expanded(
                child: ReusableCard(
                    colour:kactiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "WEIGHT",
                        style: klabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            weight.toString(),
                            style: kNumberTextStyle,
                          ),
                          Text(
                            "kg",
                            style: klabelTextStyle,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                              icon:FontAwesomeIcons.minus,
                            onPressed: (){
                                setState(() {
                                  weight--;
                                });
                            },
                          ),
                          SizedBox(width:10.0,),
                          RoundIconButton(
                              icon:FontAwesomeIcons.plus,
                            onPressed: (){
                                setState(() {
                                  weight++;
                                });
                            },
                          ),
                        ],
                      ),
                    ],

                  ),
                ),),
              Expanded(
                child:ReusableCard(
                    colour:kactiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "AGE",
                        style: klabelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style:kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                              icon:FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  age--;
                                });
                              },
                          ),
                          SizedBox(width:10.0,),
                          RoundIconButton(
                              icon:FontAwesomeIcons.plus,
                            onPressed: (){
                                setState(() {
                                  age++;
                                });

                            },
                          ),
                        ],
                      ),
                    ],

                  ),
                ),),
            ],
          )),
         bottomButton(
             buttonTitle: "CALCULATE",
             onTap:(){
               CalculatorBrain calc = CalculatorBrain(height:height, weight:weight);
               Navigator.push(context,
                   MaterialPageRoute(builder: (context)=> ResultsPage(
                     bmiResult: calc.calculateBmi(),
                     resultText:calc.getResult() ,
                     interpretation: calc.getInterpretation() ,
                   ),
                   ),
               );
             }
         ),
        ],
      ),
    );
  }
}





