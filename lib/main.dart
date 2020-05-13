import 'package:bmi_calculator/gender_button.dart';
import 'package:flutter/material.dart';

import 'package:numberpicker/numberpicker.dart';

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
        primaryColor: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
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
  int feet = 5;
  int remainderInches = 10;

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
      print('$feet\'$remainderInches\"');
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 60,
          horizontal: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
          ],
        ),
      ),
    );
  }
}
