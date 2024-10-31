import 'package:flutter/material.dart';
import 'constants.dart';
import 'reusable_card.dart';
import 'calculate_brain.dart';
import 'input_page.dart';

class Result_page extends StatelessWidget {
  const Result_page({Key? key, required this.bmiResult, required this.resultText, required this.interpretation}) : super(key: key);

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: const Text("Result_page"),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
           Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text(
            "Your result",
            style: numTextStyle,
          ))
          ),
          Expanded(
            flex: 5,
              child: Reuseable(
            colour: kActiveCardColor,
                childCard: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:  [
                    Text(
                        bmiResult.toUpperCase(),
                      style: result_card_style,
                    ),
                    Text(
                        resultText,
                      style: kBMITextStyle,
                    ),
                    Text(
                        interpretation,
                      style: kBodyTextStyle,
                      textAlign: TextAlign.center,
                    ),

                  ],
                ),

          )),
          BottomButton(title: "Recalculate"
          ,onPress: (){
            Navigator.pop(context);
            },
          )
        ],
      )
    );
  }
}
