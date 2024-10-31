import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_data.dart';
import 'result_page.dart';
import 'constants.dart';
import 'calculate_brain.dart';


enum Gender { male, female, nulll }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.nulll;
  int height = 180;
  int weight = 60;
  int age = 19;

  get onChanged => null;

  // void changeGender(){
  //   return print("hello world") ;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI CALCULATOR'),
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: Reuseable(
                      onPress: (){
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      colour: selectedGender == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      childCard: const IconContent(
                          cardIcon: FontAwesomeIcons.mars, title: "Male"),
                    )
                ),
                Expanded(
                    child: Reuseable(
                      onPress: (){
                        setState(() {
                          selectedGender = Gender.female;

                        });
                      },
                      colour: selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      childCard: const IconContent(
                          cardIcon: FontAwesomeIcons.venus, title: "Female"),
                    ))
              ],
            )),
            Expanded(child: Reuseable(
                colour: kActiveCardColor,
                childCard: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children:  [
                     const Text(
                      "HEIGHT",
                    style: labelTextStyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children:    [
                        Text(
                            height.toString(),
                          style: numTextStyle
                        ),
                        const Text(
                            "cm",
                          style: labelTextStyle
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: const Color(0xFF8D8E98),
                        thumbColor: const Color(0xFFEB1555),
                        overlayColor: const Color(0x29EB1555),
                        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 16.0),
                        overlayShape: const RoundSliderOverlayShape(overlayRadius: 30)

                      ),
                      child: Slider(
                          value: height.toDouble(),
                          min: 120,
                          max: 220,
                          onChanged: (double value){
                            setState(() {
                              height = value.toInt();
                            });
                          }),
                    )
                  ],
                ),
            )),
            Expanded(
                child: Row(
              children: [
                Expanded(child: Reuseable(
                    colour: kActiveCardColor,
                  childCard: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      const Text("WEIGHT",style: labelTextStyle,),
                          Text(weight.toString(), style: numTextStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          RoundIconButton(
                              icon:FontAwesomeIcons.minus,
                            onPress: (){
                                setState(() {
                                  weight--;
                                });
                            },
                          ),
                          SizedBox(width: 15.0,),
                          RoundIconButton(
                            onPress: (){
                              setState(() {
                                weight++;
                              });
                            },
                              icon:FontAwesomeIcons.plus,

                          )

                        ],
                      )


                    ],
                  ),
                )
                ),
                Expanded(child: Reuseable(
                  colour: kActiveCardColor,
                  childCard: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      const Text("AGE",style: labelTextStyle,),
                      Text(age.toString(), style: numTextStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          RoundIconButton(
                            icon:FontAwesomeIcons.minus,
                            onPress: (){
                              setState(() {
                                age--;
                              });
                            },
                          ),
                          SizedBox(width: 15.0,),
                          RoundIconButton(
                            onPress: (){
                              setState(() {
                                age++;
                              });
                            },
                            icon:FontAwesomeIcons.plus,

                          )

                        ],
                      )


                    ],
                  ),
                ))
              ],
            )),
            BottomButton(
              title: "Result",
              onPress: (){
                CalculatorBrain clk = CalculatorBrain(height: height, weight: weight) ;
    Navigator.push(context, MaterialPageRoute(builder: (context)=> Result_page(
      bmiResult: clk.calculteBMI(),
      resultText: clk.getResult(),
      interpretation: clk.getInterpretation(),
    )));
    },
            )
          ],
        ));
  }
}

class BottomButton extends StatelessWidget {

   final String title ;
   final Function()? onPress;

   BottomButton({super.key, required this.title,  this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: onPress,
      child: Container(
      color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: kBottomContainerHeight,

      child: Center(
        child: Text(
          title,
          style: largeTextStyle,
        ),),

      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({Key? key, required this.icon, this.onPress}) : super(key: key);

  final IconData icon ;
  final void Function()?  onPress ;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      fillColor: const Color(0xFF4C4E5F),
      shape: CircleBorder(),
      elevation: 6.5,
      constraints: BoxConstraints.tightFor(
        width: 56.0 ,
        height: 56.0
      ),
      onPressed: onPress
    );
  }
}

