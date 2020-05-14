import 'package:bmi_calculator/custom_big_button.dart';
import 'package:bmi_calculator/gender_button.dart';
import 'package:flutter/material.dart';

import 'package:numberpicker/numberpicker.dart';
import './custom_switch.dart';
import './result_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xff5E3FB7),
        accentColor: Color(0xff5E3FB7),
        buttonColor: Color(0xffDED1FF),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/results': (context) => ResultScreen(
              resultText: '21',
              resultType: 'Normal',
            ),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool male = false;
  bool female = false;
  int age = 25;
  int inches = 70;
  double weight = 140;

  int feet = 5;
  int remainderInches = 10;
  bool pounds = true;

  void inchesToFeet() {
    setState(() {
      double dec = (inches / 12);
      feet = double.parse(dec.toStringAsFixed(1)).toInt();
      int totalInches = feet * 12;
      if (totalInches >= inches) {
        remainderInches = totalInches - inches;
      } else {
        remainderInches = inches - totalInches;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: 15,
          right: 15,
          bottom: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'BMI Calculator',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text('What is your biological gender?'),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GenderButton(
                  text: 'Male',
                  selected: male,
                  onTap: () {
                    setState(() {
                      male = !male;
                      female = false;
                    });
                  },
                ),
                GenderButton(
                  text: 'Female',
                  selected: female,
                  onTap: () {
                    setState(() {
                      female = !female;
                      male = false;
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text('How old are you?'),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NumberPicker.horizontal(
                  initialValue: age,
                  minValue: 5,
                  maxValue: 79,
                  onChanged: (newValue) => setState(
                    () => age = newValue,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Text('Height: '),
                Text(
                  '$feet\'$remainderInches\"',
                  style: TextStyle(fontSize: 16, color: themeData.primaryColor),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NumberPicker.horizontal(
                  initialValue: inches,
                  minValue: 5,
                  maxValue: 79,
                  onChanged: (newValue) {
                    setState(() {
                      inches = newValue;
                      inchesToFeet();
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Weight'),
                CustomSwitch(
                  activeColor: themeData.primaryColor,
                  value: pounds,
                  onChanged: (val) {
                    setState(() {
                      pounds = val;
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Slider.adaptive(
                    value: weight,
                    activeColor: themeData.primaryColor,
                    inactiveColor: themeData.buttonColor,
                    onChanged: (newRating) {
                      setState(() {
                        weight = newRating;
                      });
                    },
                    min: 75,
                    max: 400,
                  ),
                ),
                Text(
                  '${weight.round()}',
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            CustomBigButton(
              text: 'Calculate',
              onTap: () {
                Navigator.pushNamed(context, '/results');
              },
            ),
          ],
        ),
      ),
    );
  }
}
