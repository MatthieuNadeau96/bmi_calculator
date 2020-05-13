import 'package:bmi_calculator/gender_button.dart';
import 'package:flutter/material.dart';

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
            Text('Biological Gender: '),
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
          ],
        ),
      ),
    );
  }
}
