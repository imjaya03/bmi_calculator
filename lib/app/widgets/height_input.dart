import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import './reusable_card.dart';
import '../blocs/bmi_bloc.dart';

const minHeight = 70;
const maxHeight = 270;

class HeightInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final BmiBase _bmiBloc = Provider.of<BmiBloc>(context);
    // final mediaQuery = MediaQuery.of(context);
    return StreamBuilder<int>(
      stream: _bmiBloc.height,
      initialData: minHeight,
      builder: (context, snapshot) {
        final height = snapshot.data;
        return ReusableCard(
          color: kActiveCardColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('HEIGHT', style: kLabelTextStyle),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  Text('$height', style: kNumberTextStyle),
                  Text('cm', style: kLabelTextStyle),
                ],
              ),
              Slider(
                value: height.toDouble(),
                min: minHeight.toDouble(),
                max: maxHeight.toDouble(),
                onChanged: (val) => _bmiBloc.setHeight = val.toInt(),
              ),
            ],
          ),
        );
      },
    );
  }
}
