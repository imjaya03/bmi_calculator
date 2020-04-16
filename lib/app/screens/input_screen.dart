import 'package:flutter/material.dart';
import '../widgets/height_input.dart';
import '../widgets/gender_male_input.dart';
import '../widgets/gender_female_input.dart';
import '../widgets/weight_input.dart';
import '../widgets/age_input.dart';
import '../widgets/bottom_button.dart';
import './results_screen.dart';
import '../blocs/bmi_bloc.dart';
import 'package:provider/provider.dart';

class InputScreen extends StatelessWidget {
  static const String routeName = '/input';

  @override
  Widget build(BuildContext context) {
    final BmiBase _bmiBloc = Provider.of<BmiBloc>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI Calculator'.toUpperCase()),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GenderMaleInput(),
                ),
                Expanded(
                  child: GenderFemaleInput(),
                ),
              ],
            ),
          ),
          Expanded(
            child: HeightInput(),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: WeightInput(),
                ),
                Expanded(
                  child: AgeInput(),
                ),
              ],
            ),
          ),
          BottonButton(
            onPressed: () {
              _bmiBloc.calculate();
              Navigator.of(context).pushNamed(ResultsScreen.routeName);
            },
            label: 'CALCULATE',
          )
        ],
      ),
    );
  }
}
