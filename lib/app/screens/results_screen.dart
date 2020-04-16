import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/bottom_button.dart';
import '../widgets/reusable_card.dart';
import '../blocs/bmi_bloc.dart';
import 'package:provider/provider.dart';

String getResult(double bmi) {
  if (bmi >= 25) {
    return 'Overweight';
  } else if (bmi > 18.5) {
    return 'Normal';
  } else {
    return 'Underweight';
  }
}

String getInterpretation(double bmi) {
  if (bmi >= 25) {
    return 'You Have a higher  then normal body weight. Try to exercise more.';
  } else if (bmi > 18.5) {
    return 'You have a normal body weight. Good job.';
  } else {
    return 'You have a lower then normal body weight . You can eat a bit more.';
  }
}

class ResultsScreen extends StatelessWidget {
  static const routeName = '/results';
  @override
  Widget build(BuildContext context) {
    final BmiBase _bmiBloc = Provider.of<BmiBloc>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI Calculator'.toUpperCase()),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 15.0),
              child: Text(
                'Your Results',
                style: kTitleTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          StreamBuilder<double>(
              stream: _bmiBloc.bmi,
              initialData: 0.0,
              builder: (context, snapshot) {
                return Expanded(
                  flex: 5,
                  child: ReusableCard(
                    color: kActiveCardColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          getResult(snapshot.data).toUpperCase(),
                          style: kResultTextStyle,
                        ),
                        Text(
                          snapshot.data.toStringAsFixed(1),
                          style: kBMITextStyle,
                        ),
                        Text(
                          getInterpretation(snapshot.data),
                          style: kBodyTextStyle,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    onPressed: () {},
                  ),
                );
              }),
          BottonButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            label: 'RE CALCULATE',
          ),
        ],
      ),
    );
  }
}
