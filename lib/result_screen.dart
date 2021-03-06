import 'package:bmi_calculator/custom_big_button.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  static const routeName = '/results';

  final String resultText;
  final String resultType;
  final String actualBmi;
  final bool healthy;

  ResultScreen({
    this.resultText,
    this.resultType,
    this.actualBmi,
    this.healthy,
  });

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 15,
          right: 15,
          bottom: 30,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 1),
            // SizedBox(height: 30),
            Expanded(
              flex: 2,
              child: Container(
                width: deviceSize.width,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.25),
                      offset: Offset(0, 6),
                      blurRadius: 5,
                      spreadRadius: 2,
                    )
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(flex: 2),
                    Text(
                      resultText,
                      style: TextStyle(
                        fontSize: 125,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Spacer(flex: 1),
                    Text(
                      resultType,
                      style: TextStyle(
                        color: healthy ? Colors.green : Colors.orange,
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text('BMI = $actualBmi'),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
            Spacer(flex: 1),
            // SizedBox(height: 30),
            CustomBigButton(
              text: 'Reset',
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
