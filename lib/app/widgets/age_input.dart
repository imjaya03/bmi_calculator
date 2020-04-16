import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import './reusable_card.dart';
import '../constants.dart';
import './rounded_icon_button.dart';
import '../blocs/bmi_bloc.dart';

class AgeInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final BmiBase _bmiBloc = Provider.of<BmiBloc>(context);
    return ReusableCard(
      color: kActiveCardColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('AGE', style: kLabelTextStyle),
          StreamBuilder<int>(
            stream: _bmiBloc.age,
            initialData: 15,
            builder: (context, snapshot) {
              final age = snapshot.data;
              return Text('$age', style: kNumberTextStyle);
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RoundedIconButton(
                onPressed: _bmiBloc.decrementAge,
                icon: FontAwesomeIcons.minus,
              ),
              SizedBox(
                width: 15.0,
              ),
              RoundedIconButton(
                onPressed: _bmiBloc.incrementAge,
                icon: FontAwesomeIcons.plus,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
