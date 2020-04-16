import 'package:flutter/material.dart';
import './icon_content.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './reusable_card.dart';
import '../constants.dart';
import '../blocs/bmi_bloc.dart';
import 'package:provider/provider.dart';

class GenderFemaleInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final BmiBase _bmiBloc = Provider.of<BmiBloc>(context);
    return StreamBuilder<Gender>(
      stream: _bmiBloc.gender,
      initialData: Gender.male,
      builder: (context, snapshot) {
        final selectedGender = snapshot.data;
        return ReusableCard(
          onPressed: () => _bmiBloc.setGender = Gender.female,
          child: IconContent(
            label: 'FEMALE',
            icon: FontAwesomeIcons.venus,
          ),
          color: (selectedGender == Gender.female)
              ? kActiveCardColor
              : kInactiveCardColor,
        );
      },
    );
  }
}
