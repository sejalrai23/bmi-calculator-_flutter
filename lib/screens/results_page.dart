import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';
import '../components/constants.dart';
import '../components/bottom_button.dart';
import 'input_page.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({@required this.bmiResult , @required this.resultText, @required this.interpretation});
  final String bmiResult ;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:Text(
          "BMI CALCULATOR",
          style: TextStyle(
            fontSize: 25.0,
          ),
        ),
      ),
      body : Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Container(
            margin: EdgeInsets.only(top: 30.0),
            alignment: Alignment.bottomCenter,
            child: Center(
              child: Text(
                "YOUR RESULT",
                style: kTitleTextStyle,
                ),
            ),
          ),),
          Expanded(
            flex:9,
            child: ReusableCard(
              colour: kactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText,
                    style:kResultStyle,
                  ),
                  Text(
                    bmiResult,
                    style: kBMITextStyle,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: kResultStyle,
                  ),
                ],
              ),
            ),
          ),
          bottomButton(
              buttonTitle: "RE-CALCULATE",
              onTap:(){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context)=> InputPage(),),);
              }
          ),
        ],
      ),
    );
  }
}
