import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import './reusable_card.dart';
import '../constants.dart';
import './rounded_icon_button.dart';
import '../blocs/bmi_bloc.dart';

class WeightInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final BmiBase _bmiBloc = Provider.of<BmiBloc>(context);
    return ReusableCard(
      color: kActiveCardColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('WEIGHT', style: kLabelTextStyle),
          StreamBuilder<int>(
            stream: _bmiBloc.weight,
            initialData: 60,
            builder: (context, snapshot) {
              final weight = snapshot.data;
              return Text('$weight', style: kNumberTextStyle);
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RoundedIconButton(
                onPressed: _bmiBloc.decrementWeight,
                icon: FontAwesomeIcons.minus,
              ),
              SizedBox(
                width: 15.0,
              ),
              RoundedIconButton(
                onPressed: _bmiBloc.incrementWeight,
                icon: FontAwesomeIcons.plus,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
